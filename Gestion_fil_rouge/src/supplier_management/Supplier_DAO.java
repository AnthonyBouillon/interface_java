package supplier_management;

import database_management.Login;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Supplier_DAO extends Login{

    Supplier supplier;

    public Supplier_DAO() throws SQLException {

    }

    /**
     * Ajoute dans la liste les données des fournisseurs
     *
     * @return la liste des fournisseurs
     * @throws SQLException
     */
    public List<Supplier> read() throws SQLException {
        
        ArrayList<Supplier> list_supplier = new ArrayList();
        setRequest("SELECT * FROM fournisseur");
        while (getRequest().next()) {
            supplier = new Supplier();
            supplier.setId(getRequest().getInt("id_fournisseur"));
            supplier.setName(getRequest().getString("nom_fournisseur"));
            supplier.setFirstname(getRequest().getString("prenom_fournisseur"));
            supplier.setPhone(getRequest().getString("telephone_fournisseur"));
            supplier.setEmail(getRequest().getString("email_fournisseur"));
            supplier.setAddress(getRequest().getString("adresse_fournisseur"));
            list_supplier.add(supplier);
        }
        return list_supplier;
        
    }
}
