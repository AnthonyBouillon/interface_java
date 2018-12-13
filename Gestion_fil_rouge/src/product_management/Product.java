package product_management;


public class Product {

    // Attributs correspondant à chaques champs de la table produit
    private Integer id;
    private String short_description;
    private String long_description;
    private Double price_bt;
    private String photo;
    private Integer quantity;
    private Double taxe;
    private Integer id_supplier;
    private Integer id_subheading;
    private String name_subheading;

    /**
     * ***********************************************************************
     */
                            // Getter et Setter //
    /**
     * ***********************************************************************
     */
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getShort_description() {
        return short_description;
    }

    public void setShort_description(String short_description) {
        this.short_description = short_description;
    }

    public String getLong_description() {
        return long_description;
    }

    public void setLong_description(String long_description) {
        this.long_description = long_description;
    }

    public Double getPrice_bt() {
        return price_bt;
    }

    public void setPrice_bt(Double price_bt) {
        this.price_bt = price_bt;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Double getTaxe() {
        return taxe;
    }

    public void setTaxe(Double taxe) {
        this.taxe = taxe;
    }

    public Integer getId_supplier() {
        return id_supplier;
    }

    public void setId_supplier(Integer id_supplier) {
        this.id_supplier = id_supplier;
    }

    public Integer getId_subheading() {
        return id_subheading;
    }

    public void setId_subheading(Integer id_subheading) {
        this.id_subheading = id_subheading;
    }

    public String getName_subheading() {
        return name_subheading;
    }

    public void setName_subheading(String name_subheading) {
        this.name_subheading = name_subheading;
    }
}
