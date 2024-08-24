package entity;

/**
 * @author Jdfcc
 */
public class Column {
    public String name;
    public String type;
    public boolean isPrimaryKey;
    public boolean isAutoIncrement;
    public boolean isNullable;

    public Column(String name, String type, boolean isPrimaryKey, boolean isAutoIncrement, boolean isNullable) {
        this.name = name;
        this.type = type;
        this.isPrimaryKey = isPrimaryKey;
        this.isAutoIncrement = isAutoIncrement;
        this.isNullable = isNullable;
    }
}