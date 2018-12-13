/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package subheading_management;

import database_management.Login;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author 80010-37-15
 */
public class Subheading_DAO extends Login {

    Subheading subheading;

    public Subheading_DAO() throws SQLException {
        subheading = new Subheading();
    }

    /**
     * Ajoute dans la liste les données des sous-rubriques
     *
     * @return la liste des sous-rubriques
     * @throws SQLException
     */
    public List<Subheading> read() throws SQLException {

        List<Subheading> list_subheading = new ArrayList();
        setRequest("SELECT * FROM sous_rubrique");
        while (getRequest().next()) {
            subheading = new Subheading();
            subheading.setId(getRequest().getInt("id_sous_rubrique"));
            subheading.setName(getRequest().getString("nom_sous_rubrique"));
            subheading.setId_heading(getRequest().getInt("id_rubrique"));
            list_subheading.add(subheading);
        }
        return list_subheading;
    }
}
