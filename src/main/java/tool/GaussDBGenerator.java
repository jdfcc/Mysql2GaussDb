package tool;

import entity.Column;
import entity.Index;
import entity.Table;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;


/**
 * @author Jdfcc
 */
public class GaussDBGenerator {

    public static String generateDDL(Table table) {
        StringBuilder ddl = new StringBuilder();
        ddl.append("CREATE TABLE \"").append(table.tableName).append("\" (\n");

        // 生成字段定义
        for (int i = 0; i < table.columns.size(); i++) {
            Column column = table.columns.get(i);
            ddl.append("    \"").append(column.name).append("\" ").append(mapType(column.type));

            if (column.isAutoIncrement) {
                ddl.append(" GENERATED BY DEFAULT AS IDENTITY");
            }
            if (!column.isNullable) {
                ddl.append(" NOT NULL");
            }
            if (i < table.columns.size() - 1 || !table.indexes.isEmpty()) {
                ddl.append(",");
            }
            ddl.append("\n");
        }

        // 生成主键定义
        for (Index index : table.indexes) {
            if ("PRIMARY".equalsIgnoreCase(index.indexName)) {
                ddl.append("    PRIMARY KEY (");
                for (int i = 0; i < index.columns.size(); i++) {
                    ddl.append("\"").append(index.columns.get(i)).append("\"");
                    if (i < index.columns.size() - 1) {
                        ddl.append(", ");
                    }
                }
                ddl.append(")\n");
            }
        }

        ddl.append(");\n");

        // 生成其他索引定义
        for (Index index : table.indexes) {
            if (!"PRIMARY".equalsIgnoreCase(index.indexName)) {
                ddl.append(generateIndexDDL(table.tableName, index));
            }
        }

        return ddl.toString();
    }

    private static String generateIndexDDL(String tableName, Index index) {
        StringBuilder indexDDL = new StringBuilder();
        if (index.isUnique) {
            indexDDL.append("CREATE UNIQUE INDEX \"");
        } else {
            indexDDL.append("CREATE INDEX \"");
        }
        indexDDL.append(index.indexName).append("\" ON \"").append(tableName).append("\" (");

        for (int i = 0; i < index.columns.size(); i++) {
            indexDDL.append("\"").append(index.columns.get(i)).append("\"");
            if (i < index.columns.size() - 1) {
                indexDDL.append(", ");
            }
        }

        indexDDL.append(");\n");

        return indexDDL.toString();
    }

    private static String mapType(String mysqlType) {
        // MySQL 类型到 GaussDB 类型的映射
        switch (mysqlType.toLowerCase()) {
            case "int":
                return "INTEGER";
            case "tinyint(1)":
                return "BOOLEAN";
            case "tinyint":
                return "SMALLINT";
            case "mediumint":
                return "INTEGER";
            case "bigint":
                return "BIGINT";
            case "float":
                return "FLOAT4";
            case "double":
                return "FLOAT8";
            case "decimal":
                return "NUMERIC";
            case "varchar":
                return "VARCHAR";
            case "char":
                return "CHAR";
            case "text":
                return "TEXT";
            case "blob":
                return "BYTEA";
            case "datetime":
                return "TIMESTAMP";
            default:
                return mysqlType.toUpperCase(); // 默认保留类型
        }
    }

    public static void writeAllTablesDDLToFile(List<Table> tables, String filePath) {
        StringBuilder ddlBuilder = new StringBuilder();

        for (Table table : tables) {
            String ddl = generateDDL(table);
            ddlBuilder.append(ddl).append("\n");
        }

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            writer.write(ddlBuilder.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
