package music.com.vn.service;

import music.com.vn.dto.ArtistDTO;
import music.com.vn.dto.CollectionArtistDTO;
import music.com.vn.dto.Pagination;

import java.util.List;

public interface ArtistService {
	public ArtistDTO save(ArtistDTO Artist);

	public ArtistDTO update(ArtistDTO Artist);

	public boolean delete(Long id);

	public ArtistDTO findOne(Long id);

	public List<ArtistDTO> findAll();
	
	public CollectionArtistDTO findAll(Pagination page) ;

}
