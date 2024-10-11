package com.example;


import gudusoft.gsqlparser.EDbVendor;
import gudusoft.gsqlparser.TGSqlParser;
import gudusoft.gsqlparser.stmt.TSelectSqlStatement;

import java.util.ArrayList;

public class SQLDemo {

    public static void main(String[] args) {
        String sql = "select a,b from t_stu";
        TGSqlParser sqlParser = new TGSqlParser(EDbVendor.dbvhive);
        sqlParser.sqltext = sql;

        ArrayList<ConsanguinityPOJO> pojoList = new ArrayList<>();

        int res = sqlParser.parse();
        if (res == 0) {
            String targetTable = "dc.dwm_result_table";
            TSelectSqlStatement stmt = (TSelectSqlStatement) sqlParser.sqlstatements.get(0);
            Utils.parseStatement(stmt, null, pojoList, targetTable);

        }
        pojoList.forEach(System.out::println);

    }
}
