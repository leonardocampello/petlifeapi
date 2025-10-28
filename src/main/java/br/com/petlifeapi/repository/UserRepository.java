package br.com.petlifeapi.repository;

import br.com.petlifeapi.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Integer> {
}
