/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModelDAO;

import Model.Cliente;
import java.util.ArrayList;

/**
 *
 * @author trece
 */
public interface ClienteDAO {
    
    public ArrayList<Cliente>showDataCliente(String f);
}
