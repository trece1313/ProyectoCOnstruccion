/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModelDAO;

import Model.Direccion;
import Model.Persona;
import Model.Rol;
import Model.Usuario;

/**
 *
 * @author trece
 */
public interface UsuarioDAO 
{
    public boolean addUser(Direccion dir,Persona per,Usuario usr,Rol r);
    public Usuario accesarUser(String u, String p);
    
}
