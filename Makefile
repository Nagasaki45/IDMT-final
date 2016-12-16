playlist:
	find -name "*.wav" | sed "s/.\/player\///" > player/playlist.txt

diagram:
	mermaid report/diagram.md
	mv diagram.md.png report/media/diagram.png
