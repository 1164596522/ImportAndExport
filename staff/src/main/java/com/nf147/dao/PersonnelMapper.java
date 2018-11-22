package com.nf147.dao;

import com.nf147.entity.Personnel;
import java.util.List;

public interface PersonnelMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(Personnel record);

    List<Personnel> selectAll();

    void export();

    void excelImport(String excel);

}