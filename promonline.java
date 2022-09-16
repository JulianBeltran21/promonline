
package com.backend.tiendaeb.Controller;

import com.backend.tiendaeb.Models.Categoria;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.backend.tiendaeb.Service.CategoriaService;

@RestController
@CrossOrigin("*")
@RequestMapping("/categoria")
public class CategoriarController {
    @Autowired
    private CategoriaService categoriaService;
    
    @PostMapping(value="/")
    public ResponseEntity<Categoria> agregar(@RequestBody Categoria categoria){        
        Categoria obj = categoriaService.save(categoria);
        return new ResponseEntity<>(obj, HttpStatus.OK);     
    }
   
    @DeleteMapping(value="/{id}") 
    public ResponseEntity<Categoria> eliminar(@PathVariable Integer id){ 
        Categoria obj = categoriaService.findById(id); 
        if(obj!=null) 
            categoriaService.delete(id); 
        else 
            return new ResponseEntity<>(obj, HttpStatus.INTERNAL_SERVER_ERROR); 
        return new ResponseEntity<>(obj, HttpStatus.OK); 
    }
    
    
    @PutMapping(value="/") 
    public ResponseEntity<Categoria> editar(@RequestBody Categoria categoria){ 
        Categoria obj = categoriaService.findById(categoria.getIdCategoria());
        if(obj!=null) {
            obj.setNombreCategoria(categoria.getNombreCategoria());
            obj.setDescripcionCategoria(categoria.getDescripcionCategoria());
            categoriaService.save(obj); 
        } 
        else 
            return new ResponseEntity<>(obj, HttpStatus.INTERNAL_SERVER_ERROR); 
        return new ResponseEntity<>(obj, HttpStatus.OK); 
    }
    
    @GetMapping("/list")
    public List<Categoria> consultarTodo(){
        return categoriaService.findByAll(); 
    }
    
    @GetMapping("/list/{id}") 
    public Categoria consultaPorId(@PathVariable Integer id){ 
        return categoriaService.findById(id); 
    }
}
