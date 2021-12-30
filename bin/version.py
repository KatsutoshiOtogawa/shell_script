
import sys
import fire
from collections import namedtuple

class Version(object):

    def __init__(self):
        # python_versionを環境変数で持っておく。
        # self.major_version = 3
        # self.minor_version = 6
        ValidVersion = namedtuple('ValidVersion', ['major', 'minor'])
        self.valid_version = ValidVersion(3, 6)

      

  
  # def valid(self):
  #   self.valid_version.minor
  #   self.valid_version.major
  #   return ()

    def check(self) -> bool:
        check = False
        if sys.version_info.major == self.valid_version.major and sys.version_info.minor >= self.valid_version.minor:
            # sys.stderr.write('python version greater than 3.6')
            check = True
        return check

# def check() -> bool:
#     check = False
#     if sys.version_info.major == 3 and sys.version_info.minor >= 6:
#       # sys.stderr.write('python version greater than 3.6')
#       check = True
#     return check

if __name__ == '__main__':

    fire.Fire(Version)
    # python version.py check
    # python aaa.py add 10 20
    # python multiply 10 20
