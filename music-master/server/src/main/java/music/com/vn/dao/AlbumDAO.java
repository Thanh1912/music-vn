package music.com.vn.dao;

import music.com.vn.dto.Pagination;
import music.com.vn.model.AlbumEntity;
import music.com.vn.model.UserEntity;

import java.util.List;

public interface AlbumDAO extends IOperations<AlbumEntity> {
    public List<AlbumEntity> findAll(Pagination page);

    public List<AlbumEntity> TopNew();

    public UserEntity findUserByIdAlbum(Long idAlbum);

    public int count();

    public AlbumEntity loadId(Long id);

    public List<AlbumEntity> findbyArtist(Pagination page,Long id);


    public List<AlbumEntity> findbyUser(Pagination page,Long id);

    public Long countbyUser(Long id);

    public Long countbyArtist(Long idSong);
}
