playlist:
	find -name "*.wav" | sed "s/.\/player\///" > player/playlist.txt
