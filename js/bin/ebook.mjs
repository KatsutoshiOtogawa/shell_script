// @ts-check

import { $, nothrow } from 'zx'
import { Command } from 'commander'
import path from 'path';
import { NodeFire } from './nodefire/index.mjs'
import { which, CommandNotFoundError } from './util.mjs'

/**
 * create EPubSetting
 */
class EPubSetting {

    manuscript = 'book.md'
    title = 'title.txt'
    // name = 'book.epub'
    out = 'book.epub'
    css  = 'stylesheet.css'
    coverImage  = 'cover.jpg'
    target  = './'

    /**
     * deepcopy オブジェクト
     * @returns {EPubSetting}
     */
    clone() {
      const epubSetting = new EPubSetting();
      epubSetting.manuscript = this.manuscript;
      epubSetting.title = this.title;
      epubSetting.out = this.out;
      epubSetting.css = this.css;
      epubSetting.coverImage = this.coverImage;
      epubSetting.target = this.target;
      return epubSetting;
    }
    // out という名前のpathとtargetという名前のパス
}


/**
 * クラスYの説明
 */
class Ebook {

  /** @types {EPubSetting} */
  setting = new EPubSetting();

  /** 
   * @param {string | undefined} manuscript
   * @param {string | undefined} title
   * @param {string | undefined} out
   * @param {string | undefined} css
   * @param {string | undefined} coverImage
   * @param {string | undefined} target
   * @param {EPubSetting | undefined} setting
  */
  #setSetting(manuscript = undefined, title = undefined, out = undefined, css = undefined, coverImage=undefined, target=undefined, setting=undefined){

    if (setting === undefined) {
      setting = this.setting.clone();
    }

    // set variable from parameter.
    if (manuscript !== undefined) {
      setting.manuscript = manuscript;
    }
    if (title !== undefined) {
      setting.title = title;
    }
    if (out !== undefined) {
      setting.out = out;
    }
    if (css !== undefined) {
      setting.css = css;
    }
    if (coverImage !== undefined) {
      setting.coverImage = coverImage;
    }
    if (target !== undefined) {
      setting.target = target;
    }
    return setting
  }

  /**
   * 異常なものがないか確認。
   * @throws {CommandNotFoundError} command not exists.
   */
  check() {
    which('pandoc');
  }

  /** 
   * craete epub file from markdown.
   * @param {string | undefined} manuscript
   * @param {string | undefined} title
   * @param {string | undefined} out
   * @param {string | undefined} css
   * @param {string | undefined} coverImage
   * @param {string | undefined} target
   * @param {EPubSetting | undefined} setting
   * @throws {Error} command not exists.
  */
  async md2epub(manuscript = undefined, title = undefined, out = undefined, css = undefined, coverImage=undefined, target=undefined, setting=undefined){
    // 異常なものがないか確認。
    try {
      this.check();
    } catch (error) {
      /** @type {CommandNotFoundError} */
      const err = error;
      console.error(err.message);
      throw err;
    }
    this.setting = this.#setSetting(
        manuscript
        ,title
        ,out
        ,css
        ,coverImage
        ,target
        ,setting
    )

    const args = [
      '-f','markdown'
      ,'-t', 'epub3'
      ,path.join(this.setting.target, this.setting.manuscript)
      ,path.join(this.setting.target, this.setting.title)
      ,'-o', path.join(this.setting.target, this.setting.out)
      ,'--css', path.join(this.setting.target, this.setting.css)
      ,'--toc', '--toc-depth=2'
      ,`--epub-cover-image=${path.join(this.setting.target, this.setting.coverImage)}`
    ]
    try {
      await $`pandoc ${args}`;
    } catch (p) {
      console.log(`Exit code: ${p.exitCode}`)
      console.log(`Error: ${p.stderr}`)
    }
  }

  /**
   * execute command from terminal
   */
  invoke() {
    const program = new Command();
    program
      .option('-f, --function-name <YourValue>', 'you want to execute function')
      .option('-o, --out <YourValue>', 'Rectangle hight')
      .option('-t, --title <YourValue>', 'Rectangle hight')
      .option('-t, --target <YourValue>', 'Rectangle hight')
      .option('-c, --css <YourValue>', 'Rectangle width')
      .option('-c, --cover-image <YourValue>', 'Rectangle width');

    program.parse(process.argv);
    // key-valueで値がくるので、
    const options = program.opts();

    switch (options.functionName) {
      case 'md2epub':
        this.md2epub(
          options.manuscript
          ,options.title
          ,options.out
          ,options.css
          ,options.coverImage
          ,options.target
        );
        break;

      default:
        console.log("execute unkown functions.");
    }
  }
}

// main関数の代わり
if (process.env.__MAIN__ === __filename) {
  NodeFire(Ebook)
}
