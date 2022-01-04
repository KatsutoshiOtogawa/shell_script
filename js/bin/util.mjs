// @ts-check
import { $, nothrow } from 'zx'
import { Command } from 'commander'
import { NodeFire } from './nodefire/index.mjs'

/**
 * bash which command. wrapper
 * @param {string} command you want to check exists command.
 * @returns {Promise<string | null>} if exist command return command path,not return null
 * @throws {CommandNotFoundError} exist command error
 */
export async function which(command) {
  try {
    return (await $`which ${command}`.pipe(process.stdout)).toString();
  } catch (p) {
    throw new CommandNotFoundError(command);
  }
}

/**
 * CommandNotFoundError use search command and not found command.
 * @extends {Error}
 */
export class CommandNotFoundError extends Error {
    constructor(command) {
        super(`command ${command} not found`);
        this.name = 'CommandNotFoundException';
    }
}

class Gnu {
  sed = 'sed'
  awk = 'awk'
  xargs = 'xargs'
  find = 'find'
  date = 'date'
  cut = 'cut'

  /**
   * 
   * @returns {boolean} 
   */
  is_BSD(){
    let judge = false;

    (async () => {
      if (await nothrow($`uname | grep -e Darwin -e BSD > /dev/null`).exitCode == 0) {
        judge = true
      }
    })
    return judge
  }

  /**
   * execute command from terminal
   */
  invoke() {
    const program = new Command();
    program
      .option('-f, --function-name <YourValue>', 'you want to execute function');

    program.parse(process.argv);
    // key-valueで値がくるので、
    const options = program.opts();

    switch (options.functionName) {
      case 'show':
        this.is_BSD();
        break;

      default:
        console.log("execute unkown functions.");
    }
  }
}

// class Gnu:
//     """this class is 違いを九州する BSD command and gnu command.
//     composit して使うと良い。
//     gnu = GnuEnvironment()
//     """
//     sed = 'sed'
//     awk = 'awk'
//     xargs = 'xargs'
//     find = 'find'
//     date = 'date'
//     cut = 'cut'

//     def __init__(self):

//         if self.is_BSD():
//             self.sed = 'gsed'
//             self.awk = 'gawk'
//             self.xargs = 'gxargs'
//             self.find = 'gfind'
//             self.date = 'gdate'
//             self.cut = 'gcut'

//     def is_BSD(self) -> bool:
//         judge = False
//         command1 = 'uname'
//         command2 = 'grep -e Darwin -e BSD > /dev/null'

//         process1=subprocess.Popen(shlex.split(command1),stdout=subprocess.PIPE)
//         process2=subprocess.Popen(shlex.split(command2),stdin=process1.stdout)

//         if process2.returncode == 0:
//             judge = True

// # コマンドの存在確認も入れる
//         return judge

// main関数の代わり
if (process.env.__MAIN__ === __filename) {
  NodeFire(Gnu)
}
