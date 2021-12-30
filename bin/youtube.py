
import sys
from typing import Optional
import fire
from version import Version
import pexpect
import os
import youtube_dl
from typing import Dict, List

class Youtube(object):

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
        self.storage_dir = os.environ['YOUTUBE_STORAGE']
        self.ydl_opts = {
            'format': 'bestaudio/best',
            'postprocessors': [{
                'key': 'FFmpegExtractAudio',
                'preferredcodec': 'wav',
                'preferredquality': '192'
            }],
            'postprocessor_args': [
                '-ar', '16000'
            ],
            'prefer_ffmpeg': True,
            'keepvideo': True,
            'outtmpl': self.storage_dir
        }

    def download(self, url: str, ydl_opts: Dict = None) -> None:

        if ydl_opts is None:
            ydl_opts = self.ydl_opts
        
        with youtube_dl.YoutubeDL(ydl_opts) as ydl:
            ydl.download([url])

    def multi_download(self, url_list: List[str], ydl_opts: Dict = None) -> None:

        if ydl_opts is None:
            ydl_opts = self.ydl_opts
        
        with youtube_dl.YoutubeDL(ydl_opts) as ydl:
            ydl.download(url_list)

    def install(self) -> None:
        Edition = self.Edition
        password = self.root_password
        shell_cmd = "/opt/mssql/bin/mssql-conf setup"
        prc = pexpect.spawn('/bin/bash', ['-c', shell_cmd],timeout=1200)
        prc.expect("Enter your edition")
        prc.sendline(Edition)
        prc.expect("Do you accept the license terms")
        prc.sendline("Yes")
        prc.expect("Enter the SQL Server system administrator password")
        prc.sendline(password)
        prc.expect("Confirm the SQL Server system administrator password")
        prc.sendline(password)
        prc.expect( pexpect.EOF )

if __name__ == '__main__':
    version = Version()
    if not version.check():
        print('python version greater than {1}.{2}'.
        format(version.valid_version.major,version.valid_version.minor)
            ,file=sys.stderr
        )
        exit(1)

    fire.Fire(Youtube)
    # python aaa.py add 10 20
    # python multiply 10 20
