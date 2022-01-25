fn main() {
    println!("Hello, world!");
    let s1  = String::from("HelloWorld");
    let s2  = &s1;
    let _s3: String = s2.to_string();

    println!();
}
