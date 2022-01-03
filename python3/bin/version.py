
from os import minor
import sys
import fire
from collections import namedtuple
from dataclasses import dataclass
from copy import deepcopy

ValidVersion = namedtuple('ValidVersion', ['major', 'minor'])

@dataclass
class VersionSetting:
    major: int = 3
    minor: int = 6

# python_versionを環境変数で持っておく。
# self.major_version = 3
# self.minor_version = 6

@dataclass
class Version:
    setting = VersionSetting()

  # def valid(self):
  #   self.valid_version.minor
  #   self.valid_version.major
  #   return ()

    def __setSetting(self, major: int=None, minor: int=None, setting: VersionSetting=None) -> VersionSetting:
        if setting is None:
            setting = deepcopy(self.setting)
        # setting.version

        # set variable from parameter.
        if major is not None:
            setting.major = major
        if minor:
            setting.minor = minor

        return setting

    def check(self, major: int=None, minor: int=None, setting: VersionSetting=None) -> bool:

        self.setting = self.__setSetting(major, minor, setting)

        check = False
        if sys.version_info.major == self.setting.major and sys.version_info.minor >= self.setting.minor:
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
