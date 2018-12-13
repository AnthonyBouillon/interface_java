package product_management;

import database_management.Login;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Product_DAO extends Login {

    Product product;
    private String sql;

    // Constructeur | Deux classes instanciés
    public Product_DAO() throws SQLException {
        product = new Product();
    }

    /**
     * Insert dans la base de données un nouveau produit
     *
     * @param product différente valeur pour la table produit
     * @throws SQLException
     */
    public void create(Product product) throws SQLException {
        sql = "INSERT INTO produit"
                + "(description_court_produit, description_long_produit, prix_ht_produit, photo_produit, quantite_produit, tva, id_fournisseur, id_sous_rubrique) "
                + "VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
        setRequest_p(sql);
        getRequest_p().setString(1, product.getShort_description());
        getRequest_p().setString(2, product.getLong_description());
        getRequest_p().setDouble(3, product.getPrice_bt());
        getRequest_p().setString(4, product.getPhoto());
        getRequest_p().setInt(5, product.getQuantity());
        getRequest_p().setDouble(6, product.getTaxe());
        getRequest_p().setInt(7, product.getId_supplier());
        getRequest_p().setInt(8, product.getId_subheading());
        getRequest_p().execute();
    }

    /**
     * Ajoute dans la liste les produits de la base de données
     *
     * @return @throws SQLException
     */
    public List<Product> read() throws SQLException {
        List<Product> list_product = new ArrayList();
        setRequest("SELECT * FROM produit JOIN sous_rubrique ON produit.id_sous_rubrique = sous_rubrique.id_sous_rubrique");
        while (getRequest().next()) {
            // Un produit dans la liste = un objet
            product = new Product();
            product.setId(getRequest().getInt("id_produit"));
            product.setShort_description(getRequest().getString("description_court_produit"));
            product.setLong_description(getRequest().getString("description_long_produit"));
            product.setPrice_bt(getRequest().getDouble("prix_ht_produit"));
            product.setPhoto(getRequest().getString("photo_produit"));
            product.setQuantity(getRequest().getInt("quantite_produit"));
            product.setTaxe(getRequest().getDouble("tva"));
            product.setId_supplier(getRequest().getInt("id_fournisseur"));
            product.setId_subheading(getRequest().getInt("id_sous_rubrique"));
            product.setName_subheading(getRequest().getString("nom_sous_rubrique"));
            list_product.add(product);
        }
        return list_product;

    }

    /**
     * Modifie une ligne dans la base de données
     *
     * @param product différente valeur pour la table produit
     * @throws SQLException
     */
    public void update(Product product) throws SQLException {

        setRequest_p("UPDATE produit SET description_court_produit = ?, description_long_produit = ?, prix_ht_produit = ?, photo_produit = ?, quantite_produit = ?, tva = ?, id_fournisseur = ?, id_sous_rubrique = ? WHERE id_produit = ?");
        getRequest_p().setInt(9, product.getId());
        getRequest_p().setString(1, product.getShort_description());
        getRequest_p().setString(2, product.getLong_description());
        getRequest_p().setDouble(3, product.getPrice_bt());
        getRequest_p().setString(4, product.getPhoto());
        getRequest_p().setInt(5, product.getQuantity());
        getRequest_p().setDouble(6, product.getTaxe());
        getRequest_p().setInt(7, product.getId_supplier());
        getRequest_p().setInt(8, product.getId_subheading());
        getRequest_p().execute();
    }

    /**
     * Supprime un produit et ses relations
     *
     * @param product différente valeur pour la table produit
     * @throws SQLException
     */
    public void delete(Product product) throws SQLException {
        setRequest_p("DELETE FROM commande_produit WHERE id_produit = ?");
        getRequest_p().setInt(1, product.getId());
        getRequest_p().execute();

        setRequest_p("DELETE FROM livraison_produit WHERE id_produit = ?");
        getRequest_p().setInt(1, product.getId());
        getRequest_p().execute();

        setRequest_p("DELETE FROM produit WHERE id_produit = ?");
        getRequest_p().setInt(1, product.getId());
        getRequest_p().execute();
    }
}
