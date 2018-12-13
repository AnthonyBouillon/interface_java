package model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.table.AbstractTableModel;
import product_management.Product;
import product_management.Product_DAO;

public final class Model_product extends AbstractTableModel {

    Product_DAO product_crud;
    // En-tête des colonnes
    private final String[] Titles = {"Titre", "Description", "Prix", "Photo", "Quantité", "Taxe", "Sous-rubrique"};
    // Liste des produits
    private List<Product> product_list;

    /**
     * Appelle la méthode qui retourne la liste des produits
     *
     * @throws SQLException
     */
    public Model_product() throws SQLException {
        product_crud = new Product_DAO();
        product_list = new ArrayList();
        this.product_list();
    }

    /**
     * Assigne dans {@code product_list} la méthode {@code read()} (qui contient
     * la liste de produits) de la classe {@code Product_DAO}
     *
     * @return la liste de produits
     * @throws SQLException
     */
    public List<Product> product_list() throws SQLException {
        this.product_list = product_crud.read();
        return this.product_list;
    }

    /**
     * Compte le nombre de titre ce qui correspond au nombre de colonnes
     *
     * @return le nombre de titre
     */
    @Override
    public int getColumnCount() {
        return Titles.length;
    }

    /**
     * Affiche les titres dans les colonnes
     *
     * @param column nom des colonnes
     * @return un tableau contenant les titres
     */
    @Override
    public String getColumnName(int column) {
        return Titles[column];
    }

    /**
     * Permet de connaitre le nombre de ligne contenu dans la liste de produit
     *
     * @return la taille de la liste de produit
     */
    @Override
    public int getRowCount() {
        return product_list.size();
    }

    /**
     * Affiche les données de la liste des produits dans le jTable
     * @param row nombre de ligne
     * @param column nombre de colonne
     * @return les données de la liste dans les colonnes et lignes correspondantes
     */
    @Override
    public Object getValueAt(int row, int column) {
        switch (column) {
            case 0:
                return product_list.get(row).getShort_description();
            case 1:
                return product_list.get(row).getLong_description();
            case 2:
                return product_list.get(row).getPrice_bt();
            case 3:
                return product_list.get(row).getPhoto();
            case 4:
                return product_list.get(row).getQuantity();
            case 5:
                return product_list.get(row).getTaxe();
            case 6:
                return product_list.get(row).getName_subheading();
            default:
                return null;
        }
    }

    /**
     * Ajoute un produit dans la liste et dans la bdd 
     * Met également à jour la liste de produit
     *
     * @param product différentes valeurs pour la table produit
     * @throws SQLException
     */
    public void create_product(Product product) throws SQLException {
        fireTableRowsInserted(product_list.size() - 1, product_list.size());
        product_crud.create(product);
        product_list = product_crud.read();
    }

    /**
     * Modifie un produit dans la bdd
     * Met également à jour la liste de produit
     *
     * @param product différentes valeurs pour modifier une ligne de la table produit
     * @throws SQLException
     */
    public void update_product(Product product) throws SQLException {
        product_crud.update(product);
        product_list = product_crud.read();
    }

    /**
     * Supprime un client dans la liste et dans la bdd 
     * Met également à jour la liste de produit
     *
     * @param i numéro de ligne
     * @param product différentes valeurs pour la table produit
     * @throws SQLException
     */
    public void delete_product(int i, Product product) throws SQLException {
        fireTableRowsDeleted(i, i);
        product_crud.delete(product);
        product_list = product_crud.read();
    }

}
