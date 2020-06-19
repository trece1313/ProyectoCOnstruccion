/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModelDAO;




import java.util.ArrayList;

/**
 *
 * @author trece
 * @param <T>
 */
public interface CRUD <T>
{
    public ArrayList<T>showDataCliente(String f);
    
    public ArrayList<T>showAll();
    
    public boolean add(T t);
    public boolean update(T t);
    public boolean delete(T t);
    
    public T adds(T t);
      
      
    
}
