package com.example;

import java.io.Serializable;

/**
 * @author liujian
 */
public class ConsanguinityPOJO implements Serializable {

    private static final long serialVersionUID = 8860391589138046933L;

    private Long id;

    /**
     * 数据库实例
     */
    private String dbInstance;

    /**
     * 表名
     */
    private String tableName;

    /**
     * 字段名称
     */
    private String column;


    public ConsanguinityPOJO(String dbInstance, String tableName, String column) {
        this.dbInstance = dbInstance;
        this.tableName = tableName;
        this.column = column;
        // log.info("db: {} , table: {}, clo: {}", dbInstance, tableName, column);
    }

    public ConsanguinityPOJO() {
    }

    public ConsanguinityPOJO(Long id, String dbInstance, String tableName, String column) {
        this.id = id;
        this.dbInstance = dbInstance;
        this.tableName = tableName;
        this.column = column;
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDbInstance() {
        return dbInstance;
    }

    public void setDbInstance(String dbInstance) {
        this.dbInstance = dbInstance;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public String getColumn() {
        return column;
    }

    public void setColumn(String column) {
        this.column = column;
    }

    @Override
    public String toString() {
        return "ConsanguinityPOJO{" +
                "id=" + id +
                ", dbInstance='" + dbInstance + '\'' +
                ", tableName='" + tableName + '\'' +
                ", column='" + column + '\'' +
                '}';
    }
}
