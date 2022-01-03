// @ts-check

import { $, nothrow } from 'zx'
import { Command } from 'commander'
import { NodeFire } from './nodefire/index.mjs'

/**
 * クラスYの説明
 */
class Example {
  /** @types {number} */
  #height = 3
  /** @types {number} */
  #width = 4

  show() {
    console.log(this.#height);
    console.log(this.#width);
  }

  async promise_example() {
    await Promise.all([
      $`sleep 1; echo 1`,
      $`sleep 2; echo 2`,
      $`sleep 3; echo 3`,
    ]);
  }

  /**
   * 
   * @param {string} command you want to check exists command.
   */
  async is_exist(command) {
    try {
      // bash return 0 is 
      // return non 0 value errord occour.
      await $`which ${command}`;
    } catch (p) {
      // console.log(`Error: path ${command}`)
      console.error(`Error: path ${command}`)
      // エラーを発生させる。
    }
  }

  /**
   * 
   */
  async exampleThrowError() {
    try {
      // bash return 0 is 
      // return non 0 value errord occour.
      await $`cat awesome_exists.txt | grep name`;
    } catch (p) {
      console.log(`Exit code: ${p.exitCode}`)
      console.log(`Error: ${p.stderr}`)
    }
  }

  /**
   * 
   */
  async exampleNoThrowError() {
    try {
      // bash return 0 is 
      // return non 0 value errord occour.
      await nothrow($`cat awesome_exists.txt | grep name`);
    } catch (p) {
      console.log(`Exit code: ${p.exitCode}`)
      console.log(`Error: ${p.stderr}`)
    }
  }

  /**
   * 
   * @param {string} name 
   */
  async bbb(name) {
    await $`mkdir /tmp/${name}`;
  }

  /**
   * 
   */
  async ccc() {
    const branch = await $`git branch --show-current`;
    await $`dep deploy --branch=${branch}`;
  }

  /**
   * execute command from terminal
   */
  invoke() {
    const program = new Command();
    program
      .option('-f, --function-name <YourValue>', 'you want to execute function')
      .option('-h, --height <YourValue>', 'Rectangle hight')
      .option('-w, --width <YourValue>', 'Rectangle width');

    program.parse(process.argv);
    // key-valueで値がくるので、
    const options = program.opts();

    switch (options.functionName) {
      case 'show':
        this.show();
        break;

      case 'promise_example':
        this.promise_example();
        break;

      case 'exampleThrowError':
        this.exampleThrowError();
        break;

      case 'exampleNoThrowError':
        this.exampleNoThrowError();
        break;

      default:
        console.log("execute unkown functions.");
    }
  }
}


// main関数の代わり
if (process.env.__MAIN__ === __filename) {
  NodeFire(Example)
}

