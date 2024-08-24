package entity;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Jdfcc
 */
public class Index {
    public String indexName;
    public List<String> columns;
    public boolean isUnique;

    public Index(String indexName, boolean isUnique) {
        this.indexName = indexName;
        this.columns = new ArrayList<>();
        this.isUnique = isUnique;
    }

    public void addColumn(String column) {
        this.columns.add(column);
    }
}
