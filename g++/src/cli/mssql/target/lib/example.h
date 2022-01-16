#pragma once
// #include <expect_tcl.h>
// libexpected-dev
// https://packages.debian.org/bookworm/mipsel/libdevel/libexpected-dev

namespace example {
    // GargantuanTable全体をイテレートします
    // Example:
    //    GargantuanTableIterator* iter = table->NewIterator();
    //    for (iter->Seek("foo"); !iter->done(); iter->Next()) {
    //      process(iter->key(), iter->value());
    //    }
    //    delete iter;
    class Example {
        private:
            int height_ = 3;
            int width_ = 4;
        public:
            // return example height
            int get_heigth();
            // return example width
            int get_width();
            // show class member variable
            void Show();
    };
    // Exampleの処理呼び出し。
    void Invoke();
}


// #endif /* HEADER_EXAMPLE_H */

// /**
//  * クラスYの説明
//  */
// class Example {
//   /** @types {number} */
//   #height = 3
//   /** @types {number} */
//   #width = 4

//   show() {
//     console.log(this.#height);
//     console.log(this.#width);
//   }

//   async promise_example() {
//     await Promise.all([
//       $`sleep 1; echo 1`,
//       $`sleep 2; echo 2`,
//       $`sleep 3; echo 3`,
//     ]);
//   }


//   /**
//    * 
//    */
//   async exampleThrowError() {
//     try {
//       // bash return 0 is 
//       // return non 0 value errord occour.
//       await $`cat awesome_exists.txt | grep name`;
//     } catch (p) {
//       console.log(`Exit code: ${p.exitCode}`)
//       console.log(`Error: ${p.stderr}`)
//     }
//   }

//   /**
//    * 
//    */
//   async exampleNoThrowError() {
//     try {
//       // bash return 0 is 
//       // return non 0 value errord occour.
//       await nothrow($`cat awesome_exists.txt | grep name`);
//     } catch (p) {
//       console.log(`Exit code: ${p.exitCode}`)
//       console.log(`Error: ${p.stderr}`)
//     }
//   }

//   /**
//    * 
//    * @param {string} name 
//    */
//   async bbb(name) {
//     await $`mkdir /tmp/${name}`;
//   }

//   /**
//    * 
//    */
//   async ccc() {
//     const branch = await $`git branch --show-current`;
//     await $`dep deploy --branch=${branch}`;
//   }

//   /**
//    * execute command from terminal
//    */
//   invoke() {
//     const program = new Command();
//     program
//       .option('-f, --function-name <YourValue>', 'you want to execute function')
//       .option('-h, --height <YourValue>', 'Rectangle hight')
//       .option('-w, --width <YourValue>', 'Rectangle width');

//     program.parse(process.argv);
//     // key-valueで値がくるので、
//     const options = program.opts();

//     switch (options.functionName) {
//       case 'show':
//         this.show();
//         break;

//       case 'promise_example':
//         this.promise_example();
//         break;

//       case 'exampleThrowError':
//         this.exampleThrowError();
//         break;

//       case 'exampleNoThrowError':
//         this.exampleNoThrowError();
//         break;

//       default:
//         console.log("execute unkown functions.");
//     }
//   }

