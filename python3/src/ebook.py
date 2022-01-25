
from collections import namedtuple
import sys
import fire
from .version import Version
import subprocess
from copy import deepcopy
from subprocess import CalledProcessError
from dataclasses import dataclass
from os import path

@dataclass
class EPubSetting:
    """create EPubsetting
    """
    manuscript: str = 'book.md'
    title: str = 'title.txt'
    # name: str = 'book.epub'
    out: str = 'book.epub'
    css: str = 'stylesheet.css'
    cover_image: str = 'cover.jpg'
    target: str = './'
    # out という名前のpathとtargetという名前のパス

@dataclass
class Ebook:
    """This class is creating for epub."""

    setting = EPubSetting()

    def __setSetting(self, manuscript: str=None, title: str=None, out: str=None, css: str=None, cover_image: str=None,target: str =None, setting: EPubSetting=None) -> EPubSetting:

        if setting is None:
            setting = deepcopy(self.setting)

        # set variable from parameter.
        if manuscript:
            setting.manuscript = manuscript
        if title:
            setting.title = title
        if out:
            setting.out = out
        if css:
            setting.css = css
        if cover_image:
            setting.cover_image = cover_image
        if target:
            setting.target = target

        return setting

    def md2epub(self, manuscript: str=None, title: str=None, out: str=None, css: str=None, cover_image: str=None,target: str =None, setting: EPubSetting=None) -> None:
        """initialize Youtube Class.

        This class Youtube Operating Class

        Args:
            x: int variable.
            y: int valiable.

        Returns:
            None
        
        Raises:
            CalledProcessError: An error occurred executing shell script.
        """
        self.setting = self.__setSetting(
            manuscript
            ,title
            ,out
            ,css
            ,cover_image
            ,target
            ,setting
        )

        try:
            subprocess.run([
                'pandoc','-f','markdown'
                ,'-t', 'epub3'
                ,path.join(self.setting.target, self.setting.manuscript)
                ,path.join(self.setting.target, self.setting.title)
                ,'-o', path.join(self.setting.target, self.setting.out)
                ,'--css', path.join(self.setting.target, self.setting.css)
                ,'--toc', '--toc-depth=2'
                ,'--epub-cover-image={}'.format(path.join(self.setting.target, self.setting.cover_image))
            ],check=True
            ,capture_output=True)
        except CalledProcessError as err:
            print(err.stderr, file=sys.stderr)

if __name__ == '__main__':
    version = Version()
    if not version.check():
        print(
            'python version greater than {1}.{2}'.
                format(version.setting.major,version.setting.minor)
            ,file=sys.stderr
        )
        exit(1)

    fire.Fire(Ebook)
    # python aaa.py add 10 20
    # python multiply 10 20
