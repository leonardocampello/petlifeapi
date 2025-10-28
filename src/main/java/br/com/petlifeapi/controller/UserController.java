package br.com.petlifeapi.controller;

import br.com.petlifeapi.model.User;
import br.com.petlifeapi.repository.UserRepository;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/users")
@CrossOrigin(origins = "*")
public class UserController {
    private final UserRepository repository;

    public UserController(UserRepository repository) {
        this.repository = repository;
    }

    @GetMapping
    public List<User> getAll() {
        return repository.findAll();
    }

    @GetMapping("/{id}")
    public User getById(@PathVariable Integer id) {
        return repository.findById(id).orElse(null);
    }

    @PostMapping
    public User create(@RequestBody User user) {
        return repository.save(user);
    }

    @PutMapping("/{id}")
    public User update(@PathVariable Integer id, @RequestBody User user) {
        user.setId(id);
        return repository.save(user);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable Integer id) {
        repository.deleteById(id);
    }
}
