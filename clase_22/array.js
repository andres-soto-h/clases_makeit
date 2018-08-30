var numbers = [1, 2, 3];
var doubles = numbers.map(function (x) {
    return x * 2
});


console.log(numbers);
console.log(doubles);

var words = ['spray', 'limit', 'cake', 'longlong']
var result = words.filter(word => word.length > 6);

console.log(result);


var array1 = ['a', 'b', 'c']

array1.forEach(function (element) {
    console.log(element);
})

var euros = [10, 20, 30]

var sum = euros.reduce((total, amount) => total + amount)

console.log(sum)

var post = [{
        id: 1,
        upVotes: 2
    },
    {
        id: 3,
        upVotes: 3
    },
    {
        id: 4,
        upVotes: 5
    }
];

var totalUpvotes = post.reduce((totalUp, currentPost) =>
    totalUp + currentPost.upVotes, 0);

console.log(totalUpvotes);

var findTitle = post.find(p => p.id == 3)

console.log(findTitle.upVotes)


