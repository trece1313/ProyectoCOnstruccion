/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModelDAO;



import Model.Usuario;

/**
 *
 * @author trece
 */
public interface UsuarioDAO extends CRUD<Usuario>
{
 
    public Usuario accesarUser(String u, String p);
    
}
