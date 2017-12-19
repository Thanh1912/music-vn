package music.com.vn.controller.api;

import music.com.vn.dto.AlbumDTO;
import music.com.vn.dto.CollectionAlbumDTO;
import music.com.vn.dto.Pagination;
import music.com.vn.service.AlbumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController

public class AlbumController {

	@Autowired
	AlbumService Albumservice;



	@PostMapping("/apitest/album")
	public ResponseEntity<AlbumDTO> create(@RequestBody AlbumDTO Album) {
		AlbumDTO Albumdto = Albumservice.save(Album);
		return ResponseEntity.ok(Albumdto);
	}

	@GetMapping("/apitest/album/{id}")
	public ResponseEntity<AlbumDTO> get(@PathVariable("id") Long id) {
		AlbumDTO Albumdto = Albumservice.findOne(id);
		if (Albumdto == null) {
			return new ResponseEntity<AlbumDTO>(HttpStatus.NOT_FOUND);
		}
		return ResponseEntity.ok(Albumdto);
	}


	@DeleteMapping("/apitest/album/{id}")
	public ResponseEntity delete(@PathVariable Long id) {
		if (Albumservice.delete(id) == false) {
			return new ResponseEntity<AlbumDTO>(HttpStatus.NOT_FOUND);
		}
		return ResponseEntity.ok(id);
	}

	@PutMapping(value = "/apitest/album/{id}")
	public ResponseEntity<AlbumDTO> update(@PathVariable Long id,@RequestBody AlbumDTO Albumdto) {
		Albumdto = Albumservice.update(Albumdto);
		if (null == Albumdto) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return ResponseEntity.ok(Albumdto);
	}

	@GetMapping("/apitest/album")
	public ResponseEntity<CollectionAlbumDTO> getallPage( @RequestParam(name = "size", defaultValue = "10") int recordPerPage,
																												@RequestParam(name = "page", defaultValue = "0") int pageIndex) {
		Pagination page=new Pagination();
		page.setSize(recordPerPage);
		page.setPageCurrent(pageIndex);
		CollectionAlbumDTO dto = Albumservice.findAll( page);
		if (dto == null) {
			return new ResponseEntity<CollectionAlbumDTO>( HttpStatus.NOT_FOUND);
		}
		return ResponseEntity.ok(dto);
	}


	@GetMapping("/apitest/album-by-artist/{id}")
	public ResponseEntity<CollectionAlbumDTO> getByArtistPage(@PathVariable Long id, @RequestParam(name = "size", defaultValue = "10") int recordPerPage,@RequestParam(name = "page", defaultValue = "0") int pageIndex) {
		Pagination page=new Pagination();
		page.setSize(recordPerPage);
		page.setPageCurrent(pageIndex);
		CollectionAlbumDTO dto = Albumservice.findbyArtist( page,id);
		if (dto == null) {
			return new ResponseEntity<CollectionAlbumDTO>( HttpStatus.NOT_FOUND);
		}
		return ResponseEntity.ok(dto);
	}
	@GetMapping("/apitest/album-by-kind/{id}")
	public ResponseEntity<CollectionAlbumDTO> getByKindPage(@PathVariable Long id, @RequestParam(name = "size", defaultValue = "10") int recordPerPage,@RequestParam(name = "page", defaultValue = "0") int pageIndex) {
		Pagination page=new Pagination();
		page.setSize(recordPerPage);
		page.setPageCurrent(pageIndex);
		CollectionAlbumDTO dto = Albumservice.findbyArtist( page,id);
		if (dto == null) {
			return new ResponseEntity<CollectionAlbumDTO>( HttpStatus.NOT_FOUND);
		}
		return ResponseEntity.ok(dto);
	}
	@GetMapping("/apitest/album-by-user/{id}")
	public ResponseEntity<CollectionAlbumDTO> getByUserPage(@PathVariable Long id, @RequestParam(name = "size", defaultValue = "10") int recordPerPage,@RequestParam(name = "page", defaultValue = "0") int pageIndex) {
		Pagination page=new Pagination();
		page.setSize(recordPerPage);
		page.setPageCurrent(pageIndex);
		CollectionAlbumDTO dto = Albumservice.findbyUser( page,id);
		if (dto == null) {
			return new ResponseEntity<CollectionAlbumDTO>( HttpStatus.NOT_FOUND);
		}
		return ResponseEntity.ok(dto);
	}


	@GetMapping("/apitest/album-all")
	public ResponseEntity<List<AlbumDTO>> getallPage() {
		List<AlbumDTO> listdto = Albumservice.findAll();
		return ResponseEntity.ok(listdto);
	}

	@GetMapping("/apitest/album-top")
	public ResponseEntity<List<AlbumDTO>> gettopPage() {
		List<AlbumDTO> listdto = Albumservice.TopNew();
		return ResponseEntity.ok(listdto);
	}
}
