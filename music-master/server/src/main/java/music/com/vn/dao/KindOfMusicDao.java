package music.com.vn.dao;

import music.com.vn.dto.Pagination;
import music.com.vn.model.KindOfMusicEntity;

import java.util.List;

public interface KindOfMusicDao extends IOperations<KindOfMusicEntity>{
    public KindOfMusicEntity findBySong(Long IdSong);
    public List<KindOfMusicEntity> findAll(Pagination page);
    public int count();
    public KindOfMusicEntity loadById(Long id);
}
