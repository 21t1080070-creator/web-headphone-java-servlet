/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package data.dao;

import java.util.List;
import model.Import;
import model.Import_Detail;

/**
 *
 * @author huynhvminh
 */
public interface ImportDao {
    public int createImport(int supplierId);
    public Import getImportById(int id);
    public List<Import> getAllImports();
    public boolean addImportDetail(Import_Detail detail);
    public List<Import_Detail> getImportDetails(int importId);
    public boolean completeImport(int importId);
    public void deleteImportDetail(int importId, int variantId);
}
