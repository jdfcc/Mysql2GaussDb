package entity;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Jdfcc
 */
public class Table {
    public String tableName;
    public List<Column> columns;
    public List<Index> indexes;

    public Table(String tableName) {
        this.tableName = tableName;
        this.columns = new ArrayList<>();
        this.indexes = new ArrayList<>();
    }

    public void addColumn(Column column) {
        this.columns.add(column);
    }

    public void addIndex(Index index) {
        this.indexes.add(index);
    }

}
