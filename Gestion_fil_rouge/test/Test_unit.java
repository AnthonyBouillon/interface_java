
import database_management.Login;
import java.sql.SQLException;

import java.util.logging.Level;
import java.util.logging.Logger;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;
import org.junit.Test;

import product_management.Product;
import product_management.Product_DAO;

public class Test_unit {

    Login login;
    Product product;
    Product_DAO product_crud;

    public Test_unit() {
        try {
            login = new Login();
            product = new Product();
            product_crud = new Product_DAO();
        } catch (SQLException ex) {
            Logger.getLogger(Test_unit.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Test
    public void create_test() {
        product.setShort_description("Description courte");
        product.setLong_description("Description longue");
        product.setPrice_bt(42.50);
        product.setPhoto("Chemin image");
        product.setQuantity(5);
        product.setTaxe(26.0);
        product.setId_supplier(1);
        product.setId_subheading(1);
        boolean data_create = false;
        try {
            product_crud.create(product);
            data_create = true;
        } catch (SQLException ex) {
            fail(ex.getMessage());
        }
        assertTrue(data_create);
    }

    @Test
    public void create_test_2() {
        product.setShort_description("Description courte");
        product.setLong_description("Description longue");
        product.setPrice_bt(42.50);
        product.setPhoto("Chemin image");
        product.setQuantity(5);
        product.setTaxe(26.0);
        product.setId_supplier(1);
        product.setId_subheading(1);
        boolean data_create = false;
        String word = "";
        try {
            product_crud.create(product);
            login.setRequest("SELECT description_court_produit FROM produit WHERE id_produit = (SELECT MAX(id_produit) FROM produit)");
            while (login.getRequest().next()) {
                word = login.getRequest().getString("description_court_produit");
                System.out.println(word);
            }
            if (word.equals("Description courte")) {
                data_create = true;
            }
        } catch (SQLException ex) {
            fail(ex.getMessage());
        }
        assertTrue(data_create);
    }

    @Test
    public void read_test() {
        boolean data_list = false;
        try {
            for (Product list_product : product_crud.read()) {
                System.out.println(list_product.getShort_description() + " " + list_product.getLong_description() + " " + list_product.getId() + " " + list_product.getName_subheading());
                data_list = true;
            }
        } catch (SQLException ex) {
            fail(ex.getMessage());
        }
        assertTrue(data_list);
    }

    @Test
    public void read_test_2() {
        boolean data_list = false;
        int cmpt = 0;
        try {
            login.setRequest("SELECT count(id_produit) FROM produit");
            while (login.getRequest().next()) {
                cmpt = login.getRequest().getInt("count(id_produit)");
            }
            if (product_crud.read().size() == cmpt) {
                data_list = true;
            }
        } catch (SQLException ex) {
            fail(ex.getMessage());
        }
        assertTrue(data_list);
    }

    @Test
    public void update_test() {
        boolean data_update = false;
        product.setId(10);
        product.setShort_description("Description courte modifier");
        product.setLong_description("Description longue modifier");
        product.setPrice_bt(42.50);
        product.setPhoto("Chemin image modifier");
        product.setQuantity(5);
        product.setTaxe(26.0);
        product.setId_supplier(1);
        product.setId_subheading(1);
        try {
            product_crud.update(product);
            data_update = true;
        } catch (Exception ex) {
            fail(ex.getMessage());
        }
        assertTrue(data_update);
    }

    @Test
    public void delete_test() {
        boolean data_delete = false;
        product.setId(3);
        try {
            product_crud.delete(product);
            data_delete = true;
        } catch (Exception ex) {
            fail(ex.getMessage());
        }
        assertTrue(data_delete);
    }
}
