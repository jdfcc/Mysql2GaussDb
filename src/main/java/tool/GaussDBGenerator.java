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

            if (!column.isNullable) {
                ddl.append(" NOT NULL");
            }

            if (i < table.columns.size() - 1) {
                ddl.append(",");
            }
            ddl.append("\n");
        }

        ddl.append(");\n");

        // 生成列注释
        for (Column column : table.columns) {
            if (column.comment != null && !column.comment.isEmpty()) {
                ddl.append("COMMENT ON COLUMN \"").append(table.tableName)
                        .append("\".\"").append(column.name).append("\" IS '")
                        .append(column.comment).append("';\n");
            }
        }

        // 生成主键定义
        for (Index index : table.indexes) {
            if ("PRIMARY".equalsIgnoreCase(index.indexName)) {
                ddl.append("ALTER TABLE \"").append(table.tableName).append("\" ADD PRIMARY KEY (");
                for (int i = 0; i < index.columns.size(); i++) {
                    ddl.append("\"").append(index.columns.get(i)).append("\"");
                    if (i < index.columns.size() - 1) {
                        ddl.append(", ");
                    }
                }
                ddl.append(");\n");
            }
        }

        // 生成其他索引定义
        for (Index index : table.indexes) {
            if (!"PRIMARY".equalsIgnoreCase(index.indexName)) {
                ddl.append("CREATE INDEX \"").append(table.tableName).append("_").append(index.indexName)
                        .append("\" ON \"").append(table.tableName).append("\" (");
                for (int i = 0; i < index.columns.size(); i++) {
                    ddl.append("\"").append(index.columns.get(i)).append("\"");
                    if (i < index.columns.size() - 1) {
                        ddl.append(", ");
                    }
                }
                ddl.append(");\n");
            }
        }

        return ddl.toString();
    }


    private static String mapType(String mysqlType) {
        // 提取类型名称和可能的长度（如果有的话）
        String type = mysqlType.split("\\(")[0].toLowerCase();

        switch (type) {
            case "int":
                return "INTEGER";
            case "tinyint(1)":
                return "BOOLEAN";
            case "longtext":
                return "text";
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
                return mysqlType.toUpperCase();
            case "varchar":
                return mysqlType.toUpperCase();
            case "char":
                return mysqlType.toUpperCase();
            case "text":
                return "TEXT";
            case "blob":
                return "BYTEA";
            case "datetime":
                return "TIMESTAMP";
            default:
                return mysqlType.toUpperCase();
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
