/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModelDAO;

/**
 *
 * @author trece
 * @param <D>
 */
public interface DetalleDAO <D>
{
    public D consulta(String buscar);
}
