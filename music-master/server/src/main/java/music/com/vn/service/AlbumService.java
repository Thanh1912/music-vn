package music.com.vn.service;

import music.com.vn.dto.AlbumDTO;
import music.com.vn.dto.CollectionAlbumDTO;
import music.com.vn.dto.Pagination;
import music.com.vn.dto.UserDTO;

import java.util.List;

public interface AlbumService {
	public AlbumDTO save(AlbumDTO Album);

	public AlbumDTO update(AlbumDTO Album);

	public boolean delete(Long id);

	public AlbumDTO findOne(Long id);

	public List<AlbumDTO> findAll();

	public CollectionAlbumDTO findAll(Pagination page) ;

	public UserDTO findUserByIdAlbum(Long idAlbum);

	public List<AlbumDTO> TopNew();

	public CollectionAlbumDTO findbyArtist(Pagination page,Long id) ;
	public CollectionAlbumDTO findbyUser(Pagination page,Long id) ;
}
