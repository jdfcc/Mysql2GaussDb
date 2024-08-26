package tool;

import entity.Column;
import entity.Index;
import entity.Table;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Jdfcc
 */

public class MySQLParser {

    public static List<Table> parseMySQLFile(String filePath) {
        List<Table> tables = new ArrayList<>();
        Table currentTable = null;

        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                line = line.trim();

                // 解析 CREATE TABLE 语句
                if (line.startsWith("CREATE TABLE")) {
                    String tableName = line.split("`")[1];
                    currentTable = new Table(tableName);
                    tables.add(currentTable);
                }

                // 解析字段定义
                if (line.startsWith("`")) {
                    String[] parts = line.split(" ");
                    String columnName = parts[0].replace("`", "");
                    String columnType = parts[1];

                    boolean isPrimaryKey = line.toLowerCase().contains("primary key");
                    boolean isAutoIncrement = line.toLowerCase().contains("auto_increment");
                    boolean isNullable = !line.toLowerCase().contains("not null");

                    // 提取列注释
                    String comment = null;
                    if (line.toLowerCase().contains("comment")) {
                        int commentIndex = line.toLowerCase().indexOf("comment '");
                        comment = line.substring(commentIndex + 9, line.lastIndexOf("'")).trim();
                    }

                    Column column = new Column(columnName, columnType, isPrimaryKey, isAutoIncrement, isNullable, comment);
                    if (currentTable != null) {
                        currentTable.addColumn(column);
                    }
                }


                // 解析 PRIMARY KEY
                if (line.startsWith("PRIMARY KEY")) {
                    String indexName = "PRIMARY";
                    String[] columnsPart = line.substring(line.indexOf("(") + 1, line.indexOf(")")).split(",");
                    Index index = new Index(indexName, true);
                    for (String column : columnsPart) {
                        index.addColumn(column.trim().replace("`", ""));
                    }
                    if (currentTable != null) {
                        currentTable.addIndex(index);
                    }
                }

                // 解析 UNIQUE KEY 和 KEY
                if (line.startsWith("UNIQUE KEY") || line.startsWith("KEY") || line.startsWith("INDEX")) {
                    boolean isUnique = line.startsWith("UNIQUE KEY");
                    String indexName = line.split("`")[1];
                    String[] columnsPart = line.substring(line.indexOf("(") + 1, line.indexOf(")")).split(",");
                    Index index = new Index(indexName, isUnique);
                    for (String column : columnsPart) {
                        index.addColumn(column.trim().replace("`", ""));
                    }
                    if (currentTable != null) {
                        currentTable.addIndex(index);
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return tables;
    }
}
