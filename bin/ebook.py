
import sys
import fire
from version import Version
from typing import Dict, List
import subprocess


class Ebook(object):

    def __init__(self) -> None:
        """initialize Youtube Class.

        This class Youtube Operating Class

        Args:
            x: int variable.
            y: int valiable.

        Returns:
            None
        
        Raises:
            KeyError: An error occurred accessing not existing variable 'YOUTUBE_STORAGE'.
        """
        # self.storage_dir = os.environ['YOUTUBE_STORAGE']

    def md2epub(self, epub_opt: Dict = None) -> None:

        manuscript = 'routinetask.md'
        title = 'title.txt'
        out = 'book.epub'
        css = 'stylesheet.css'
        cover_image = 'cover.jpg'
        subprocess.run([
            'pandoc','-f','markdown'
            ,'-t', 'epub3'
            ,manuscript
            ,title
            ,'-o', out
            ,'--css', css
            ,'--otc', '--toc-depth=2'
            ,'--epub-cover-image={}'.format(cover_image)
        ], capture_output=True)
#   pandoc -f markdown \
#     -t epub3 \
#     routinetask.md \
#     title.txt \
#     -o book.epub \
#     --css stylesheet.css \
#     --toc --toc-depth=2 \
#     --epub-cover-image=cover.jpg
        # if epub_opt is None:
        #     self.epub_opt = epub_opt
        

if __name__ == '__main__':
    version = Version()
    if not version.check():
        print('python version greater than {1}.{2}'.
        format(version.valid_version.major,version.valid_version.minor)
            ,file=sys.stderr
        )
        exit(1)

    fire.Fire(Ebook)
    # python aaa.py add 10 20
    # python multiply 10 20
