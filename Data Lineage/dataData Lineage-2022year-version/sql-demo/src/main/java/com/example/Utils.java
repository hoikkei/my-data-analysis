package com.example;

import gudusoft.gsqlparser.ETableSource;
import gudusoft.gsqlparser.TBaseType;
import gudusoft.gsqlparser.nodes.*;
import gudusoft.gsqlparser.stmt.TSelectSqlStatement;
import org.apache.commons.lang3.StringUtils;

import java.util.List;
import java.util.Objects;

/**
 * @author liujian
 */
public class Utils {

    public static void parseExpr(TExpression expr, String aliasName, List<ConsanguinityPOJO> pojoList, String targetTable) {
        if (Objects.nonNull(expr)) {
            if (Objects.nonNull(expr.getObjectOperand())) {
                pojoList.add(buildPojo(expr, aliasName, targetTable));
                return;
            }

            switch ((expr.getExpressionType())) {
                case case_t:
                    TExpression inputExpr = expr.getCaseExpression().getInput_expr();
                    if (Objects.nonNull(inputExpr)) {
                        parseExpr(inputExpr, aliasName, pojoList, targetTable);
                    }
                    TExpression elseExpr = expr.getCaseExpression().getElse_expr();
                    if (Objects.nonNull(elseExpr)) {
                        parseExpr(elseExpr, aliasName, pojoList, targetTable);
                    }
                    TWhenClauseItemList whenClauseItemList = expr.getCaseExpression().getWhenClauseItemList();
                    whenClauseItemList.forEach(item -> {
                        TExpression comparisonExpr = item.getComparison_expr();
                        parseExpr(comparisonExpr, aliasName, pojoList, targetTable);
                        TExpression returnExpr = item.getReturn_expr();
                        parseExpr(returnExpr, aliasName, pojoList, targetTable);
                    });
                    break;
                case function_t:
                    TFunctionCall functionCall = expr.getFunctionCall();
                    TExpression castExpr = functionCall.getCastOperand();
                    if (Objects.nonNull(castExpr)) {
                        parseExpr(castExpr, aliasName, pojoList, targetTable);
                    }
                    TExpressionList expressions = expr.getFunctionCall().getArgs();
                    if (Objects.nonNull(expressions)) {
                        expressions.forEach(expr1 -> {
                            parseExpr(expr1, aliasName, pojoList, targetTable);
                        });
                    }
                    break;
                case simple_object_name_t:
                    pojoList.add(buildPojo(expr, aliasName,targetTable));
                    break;
                case arithmetic_plus_t:
                case parenthesis_t:
                case arithmetic_modulo_t:
                case logical_and_t:
                case arithmetic_times_t:
                case arithmetic_divide_t:
                case simple_comparison_t:
                case array_access_expr_t:
                    TExpression leftExpr = expr.getLeftOperand();
                    parseExpr(leftExpr, aliasName, pojoList, targetTable);
                    TExpression rightExpr = expr.getRightOperand();
                    parseExpr(rightExpr, aliasName, pojoList, targetTable);
                    break;
                default:
                    break;

            }

        }
    }

    private static ConsanguinityPOJO buildPojo(TExpression expr, String aliasName, String targetTable) {
        String tmpName = "subquery";
        //目标来源
        String columnName = expr.getObjectOperand().getColumnNameOnly();
        TTable sourceTable = expr.getObjectOperand().getSourceTable();
        if (Objects.nonNull(sourceTable)) {
            String tableName = sourceTable.getTableName().getTableString().toLowerCase();
            if (tmpName.equals(tableName) && StringUtils.isNotBlank(aliasName)) {
                tableName = aliasName;
            }
            String schema = sourceTable.getTableName().getSchemaString();
            //log.info("sourceTb: {}, col: {}-> targetTb: {} ,targetCol: {}",  tableName, columnName, targetTable, columnName);
            return new ConsanguinityPOJO(schema, tableName, columnName);
        }

        // TODO 获取不到表结构和字段如何处理
        return null;
    }

    public static void parseStatement(TSelectSqlStatement stmt, String aliasName, List<ConsanguinityPOJO> pojoList, String targetTable) {
        // 判断是否是子查询
        //log.debug("表个数: {}", stmt.getJoins().size());
        if (stmt.getJoins().size() >= 1) {
            for (TJoin join : stmt.joins) {
                switch (join.getKind()) {
                    case TBaseType.join_source_fake:
                    case TBaseType.join_source_table:
                        TTable table = join.getTable();
                        if (table.getTableType() == ETableSource.subquery) {
                            TSelectSqlStatement statement = table.getSubquery();
                            if (Objects.nonNull(statement)) {
                                parseStatement(statement, null, pojoList, table.getAliasName());
                            }
                        }
                        TResultColumnList resultColumnList = stmt.getResultColumnList();
                        resultColumnList.forEach(column -> {
                            Utils.parseExpr(column.getExpr(), table.getAliasName(), pojoList, targetTable);
                        });
                        break;
                    case TBaseType.join_source_join:
                        // TODO hive不支持该语法
                        //  select a_join.f1  from (a as a_alias left join a1 on a1.f1 = a_alias.f1 ) as a_join  join b on a_join.f1 = b.f1
                        break;
                    default:
                        break;
                }
            }

        } else {
            TSelectSqlStatement leftStmt = stmt.getLeftStmt();
            if (Objects.nonNull(leftStmt)) {
                parseStatement(leftStmt, null, pojoList, targetTable);
            }

            TSelectSqlStatement rightStmt = stmt.getRightStmt();
            if (Objects.nonNull(rightStmt)) {
                parseStatement(rightStmt, null, pojoList, targetTable);
            }

        }
    }
}
