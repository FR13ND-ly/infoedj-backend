package com.example.backend.repo;

import com.example.backend.model.Review;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ReviewRepo extends JpaRepository<Review, Long> {

    void deleteReviewById(Long id);

}
