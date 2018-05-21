pragma solidity 0.4.23;


contract Bookshelf {
    mapping(uint => Book) public books;

    struct Book {
        string title;
        uint pages;
    }

    constructor() public {
        books[0] = Book({ title: "The Internet of Money", pages: 150 });
    }

    function getBook(uint _id) view public returns (string, uint) {
        // look up the book by id and return title and pages using single return instruction
        return (books[_id].title, books[_id].pages);
    }

    function getBookTitle(uint _id) view public returns (string title) {
        // use getBook and return title without using return explicitly and in a single line
        uint256 pages;
        (title, pages) = getBook(_id);
    }
}
