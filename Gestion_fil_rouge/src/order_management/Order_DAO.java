package order_management;

import database_management.Login;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Order_DAO extends Login{

    Order order;
    // Constructeur | Deux classes instanciés

    public Order_DAO() throws SQLException {
        order = new Order();
    }

    /**
     * Récupère l'année des premières commandes
     *
     * @return @throws SQLException
     */
    public int min_year() throws SQLException {
        int min_year;
        setRequest("SELECT year(min(date_commande)) as \"min_year\" FROM commande;");
        getRequest().next();
        min_year = getRequest().getInt("min_year");
        return min_year;
    }

    /**
     * Ajoute dans la liste les produits de la base de données
     *
     * @param year l'année sélectionnée
     * @return @throws SQLException
     */
    public List<Order> read(int year) throws SQLException {
        List<Order> list_order = new ArrayList();
        setRequest_p("SELECT commande_produit.id_produit AS \"Référence\", produit.description_court_produit AS \"Nom du produit\", SUM(commande_produit.quantite) AS \"Quantité commandée\", fournisseur.nom_fournisseur AS \"Fournisseur\" FROM commande_produit\n"
                + "JOIN produit ON commande_produit.id_produit = produit.id_produit\n"
                + "JOIN fournisseur ON produit.id_fournisseur = fournisseur.id_fournisseur\n"
                + "JOIN commande ON commande.id_commande = commande_produit.id_commande\n"
                + "WHERE year(commande.date_commande) = ? GROUP BY commande_produit.id_produit");
        getRequest_p().setInt(1, year);
        getRequest_p().execute();
        ResultSet result = getRequest_p().executeQuery();
        while (result.next()) {
            order = new Order();
            order.setId_product(result.getInt("Référence"));
            order.setName_product(result.getString("Nom du produit"));
            order.setQuantity_product(result.getInt("Quantité commandée"));
            order.setName_supplier(result.getString("Fournisseur"));
            list_order.add(order);
        }
        return list_order;

    }

}
