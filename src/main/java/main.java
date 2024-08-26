import entity.Table;
import tool.GaussDBGenerator;
import tool.MySQLParser;

import java.util.List;

/**
 * @author Jdfcc
 */
public class main {

    public static void main(String[] args) {
        String mysqlFilePath = "src/main/resources/hoox_payment.sql";
        List<Table> tables = MySQLParser.parseMySQLFile(mysqlFilePath);

        for (Table table : tables) {
            // 生成 GaussDB DDL
            String ddl = GaussDBGenerator.generateDDL(table);

            // 将所有表的 DDL 写入到一个文件中
            String outputFilePath = "src/main/resources//gaussdb_ddl.sql";
            GaussDBGenerator.writeAllTablesDDLToFile(tables, outputFilePath);

            System.out.println("所有表的 DDL 已成功写入文件：" + outputFilePath);
        }
    }
}
