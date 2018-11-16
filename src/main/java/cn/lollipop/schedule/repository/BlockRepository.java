package cn.lollipop.schedule.repository;

import cn.lollipop.schedule.domain.Block;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BlockRepository extends JpaRepository<Block, String> {
}