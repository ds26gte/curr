#lang curr/lib

@title{Unit 2: Defining Values and Functions }

@unit-overview/auto[#:lang-table (list (list "Number" 
                                              @code{num-sqrt, num-sqr} 
                                              @code{4, -1.2. 2/3})
                                       (list "String" 
                                              @code{string-repeat} 
                                              (list @code{"hello" "91"} ))
                                       (list "Boolean" 
                                              @code{} 
                                              (list @code{true false} ))
                                       (list "Image" 
                                              @code{triangle, star, draw-chart...} 
                                              (list @bitmap{images/imgValue1.png} @bitmap{images/imgValue2.png}))
                                       )]{
  @unit-descr{
    Students choose the dataset they are going to explore, and begin their research papers. In the process, they learn how to write their own definitions, first defining static values and then complete functions. They are also introduced to the Design Recipe - a structured approach to solving word problems and defining functions.
  }
}
@unit-lessons{

@lesson/studteach[
     #:title "Review"
     #:duration "10 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list)
     #:materials @itemlist[]
     #:preparation @itemlist[]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
                @point{
                      @student{
                            Let's take a look at a real dataset, like the kind you might get from your local animal shelter. Open up the @editor-link[#:public-id "0BzzMl1BJlJDkVTlPTjlIWFB2aDA" "Unit 2 Starter File"]. Click "Connect to Google Drive" to sign into your Google account, and then click the "Save as" button. This will save a copy of the file into your own account, so that you can make changes and retrieve them later.
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                            This file contains some new code that you haven't seen before. At the top is the @code{include} line, which imports a library of useful functions for Data Science. After that there's another @code{include} line, which imports a library of functions for using Google Sheets as part of our program:
                            @code[#:multi-line #t]{
                              include gdrive-sheets
                            }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                            On line 7, the @code{load-spreadsheet} function is used to load a spreadsheet file from Google Drive, and give the file a name (@code{shelter-sheet}). After that, we see the following code:
                            @code[#:multi-line #t]{
                              # load the 'pets' sheet as a table called animals
                              animals = load-table: name, species, age, fixed, legs
                                source: pets-sheet.sheet-by-name("pets", true)
                              end
                            }
                            Just as you saw with our @code{shapes} example, this code @italic{defines a new table}. This time, it's called @code{animals}, and it's loaded from our Google Sheet. On line 10, you can see the names we are giving to each of the columns, called @code{name}, @code{name}, @code{animal}, @code{age}, @code{fixed}, and @code{legs}.
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                            Click "Run", and type @code{animals} into the Interactions Area to see what this table looks like.
                            @itemlist[
                              @item{How many columns does this table have?}
                              @item{For each column, is the data quantitative or qualitative? }
                              @item{For each column, what datatype is being used? Numbers? Strings? Images? Booleans? }
                              @item{How could you get row for the animal named "Toggle"? }
                              @item{How could you get the age of the animal named "Sasha"? }
                              @item{How could you get the species of the animal named "Fritz"? }
                              @item{How could you get the number of legs of the animal named "Mittens"? }
                            ]
                      }
                      @teacher{
                            Make sure students are comfortable with @code{get-row} and row-accessors (the last four questions) before proceeding. Review with the whole class.
                      }
                }
        ]
  }


@lesson/studteach[
     #:title "Defining Values"
     #:duration "10 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list)
     #:materials @itemlist[]
     #:preparation @itemlist[]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
            @point{
                  @student{
                        As you've seen Pyret allows us to define names for values using the @code{=} sign. In math, you're probably used to seeing definitions like @math{x = 4}, which defines the name @code{x} to be the value @code{4}. Pyret works the same way, and you've already seen two names defined in this file: @code{shelter-sheet} and @code{animals}. We generally write definitions on the left, in the Definitions Area.
                        You can add your own definitions, for example:
                        @code[#:multi-line #t]{
                            name = "Nancy"
                            sum = 2 + 2
                            image = triangle(10, "solid", "red")
                        }
                        @activity{
                            With your partner, take turns adding definitions to this file:
                            @itemlist[
                              @item{Define a value with name @code{food}, whose value is a String representing your favorite food}
                              @item{Define a value with name @code{year}, whose value is a Number representing the current year}
                              @item{Define a value with name @code{color}, whose value is an Image drawn in your favorite color}
                              @item{Define a value with name @code{likes-cats}, whose value is a Boolean that is true if you like cats and false if you don't}
                            ]
                        }

                  }
                  @teacher{
                          
                  }
            }
            @point{
                  @student{
                        Each row of our @code{animals} table represents a single animal in oiur shelter. We can use the @code{get-row} function from yesterday to define values. For example:
                        @code[#:multi-line #t]{
                          pet1 = get-row(animals, 3) # the Row for Mittens
                        }
                        @activity{
                            Select two pets from the @code{animals} table that you would most like to adopt, and two more than you would @italic{least} like to adopt (don't worry, those animals will find homes too!). What rows are they? Define @code{pet1}, @code{pet2}, etc, whose values are the Rows representing those pets. 
                        }
                  }
                  @teacher{

                  }
            }
      ]
  }

@lesson/studteach[
     #:title "Defining Functions"
     #:duration "40 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list)
     #:materials @itemlist[]
     #:preparation @itemlist[]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
                @point{
                        @student{
                              Suppose you work at the animal shelter, taking care of all the animals who live there. You want to make sure they're healthy, happy, and find good homes. For each animal, you might want to ask certain questions:
                              @itemlist[
                                @item{When was this animal born?}
                                @item{Has it been fixed?}
                                @item{Is it an adult?}
                                @item{Is it a puppy?}
                              ]
                        }
                        @teacher{
                            Have students brainstorm additional questions!
                        }
                }
                @point{
                      @student{
                            Suppose I want to know what year an animal was born. For each Row, I could subtract the @code{age} column from the current year. We know lots of functions in Pyret that can handle Numbers, Strings, Images and so on, but none that can handle animals! @bold{We need to build our own.}
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                            To build our own functions, we'll use something called the @bold{Design Recipe}. The Design Recipe is a way to think through the behavior of a function, to make sure we don't make any mistakes with the animals that depend on us! The Design Recipe has three steps, and we'll go through them together for our first function.
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                            @bold{Step 1: Contract and Purpose}. The first thing we do is write a Contract for this function. You already know a lot about contracts: they tell us the Name, Domain and Range of the function. Our function tells us the year an animal was born, consumes an animal (represented by a @code{Row} in our table), and produces a @code{Number} representing the year. A Purpose Statement is just an description of what the function does:
                            @code[#:multi-line #t]{
                              year-born :: (animal :: Row) -> Number
                              # Consumes an animal, and produces the year the animal was born by subtracting it's age from the current year
                            }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                            @bold{Step 2: Write Examples}. You already know how to write examples, and this is no different. We start with the name of the function we're writing, followed by an example input. Let's use one of the pets we defined earlier as an example, and then write down the work we need to do to get the year it was born:
                            @code[#:multi-line #t]{
                              year-born :: (animal :: Row) -> Number
                              # Consumes an animal, and produces the year the animal was born by subtracting it's age from the current year
                              examples:
                                year-born(pet1) is 2017 - pet1["age"]
                              end
                            }
                            @activity{
                                @itemlist[
                                  @item{Add another example to your block, using the @code{pet2} you defined earlier.}
                                  @item{Do you notice a pattern? Most of your examples are exactly the same, and only a small bit is changing: @code{pet1} and @code{pet2}.}
                                  @item{Circle all of the parts in your example block that are changing.}
                                  @item{What does the stuff you circled represent? Are @code{pet1} and @code{pet2} years? Legs? No - they are @italic{animals}! Let's label them...}
                                ]
                                  
                            }
                      }
                      @teacher{
                            Walk through this first example @italic{carefully}. Make sure students understand where the @code{year-born} came from the Name in our contract, and that @code{pet1} came from the Domain in our contract. @code{2017 - pet1["age"]} came from our purpose statement, and the label also came from the variable name in our contract.
                      }
                }
                @point{
                    @student{
                          @bold{Step 3: Define the Function}. After having written our examples, this part is easy! The part of the examples before @code{is} tells us how to begin. We start with the @code{fun} keyword (short for "function"), followed by the name of our function and a set of parentheses. This is exactly how all of our examples started, too. But instead of writing @code{pet1}, we'll use the @italic{label} that we gave it. Then we add a colon (@code{:}) in place of @code{is}, and continue to follow our examples, replacing anything we circled with the label. Finally, we finish with the @code{end} keyword.
                          @code[#:multi-line #t]{
                              year-born :: (animal :: Row) -> Number
                              # Consumes an animal, and produces the year the animal was born by subtracting it's age from the current year
                              examples:
                                year-born(pet1) is 2017 - pet1["age"]
                                year-born(pet2) is 2017 - pet2["age"]
                              end
                              fun year-born(animal):
                                2017 - animal["age"]
                              end
                            }
                    }
                }
                @point{
                    @student{
                          Now that we've defined our function, we can click "Run" and actually use it!
                          @activity{
                              After you've clicked run, try typing in the following expressions, and see what happens:
                              @code[#:multi-line #t]{
                                  year-born(pet3)
                                  year-born(pet4)
                                  year-born(get-row(animals, 8))
                                  year-born(get-row(animals, 11))
                              }
                          }
                    }
                    @teacher{

                    }
                }
                @point{
                    @student{
                        Our @code{examples:} block is a helpful way to @italic{check our work}, so we don't make mistakes. Suppose we had a typo in our function definition, and added instead of subtracted:
                        @code[#:multi-line #t]{
                            fun year-born(animal):
                              2017 + animal["age"]
                            end
                        }
                        Try making this change to your code, and clicking "Run". What happens?
                    }
                }
                @point{
                    @student{
                        Now that you've walked through the Design Recipe once, it's time to get some practice! For each of the following problems, use a page in your student workbook. Don't forget to write all three steps: (1) Contract & Purpose, (2) Examples & Labels, and (3) Definition!
                        @itemlist[
                            @item{ Write a function called @code{young-pet}, which consumes a Row of the animals table and produces true if it's less than 2 years old. }
                            @item{ Write a function called @code{nametag}, prints out each animal's name in big red letters. (Get fancy, by overlaying their name on top of a yellow rectangle!) }
                            @item{ Write a function called @code{fixed-dog}, which consumes a Row of the animals table and produces true if it's a dog that's been fixed. }
                            @item{ Write a function called @code{sentence}, which consumes a Row of the animals table and produces a String containing the animal's name, the word "the", and the species of the animal. (For example, "Nori the dog". }
                        ]
                    }
                }
        ]
}

@lesson/studteach[
     #:title "Choose Your Dataset"
     #:duration "15 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list)
     #:materials @itemlist[]
     #:preparation @itemlist[@item{}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
                @point{
                      @student{
                          Throughout this course, you'll be analyzing this dataset and writing up your findings. As you learn new tools for data science, you'll continue to refine this analysis, answering questions and raising new ones of your own!
                          Take 5 minutes to look through the following datasets, and choose one that interests you:
                          @itemlist[
                              @item{
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/1SaR2M6Z-s40UuRg3u1aQU-G1GVdcm0RgHpqQ9LNmSQk" "Movies Dataset") (and the @editor-link[#:public-id "0BzzMl1BJlJDkbktKVk1zeEhNUXM" "Starter file"] for this dataset)
                              }
                              @item{
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/1yHPM-poscv6azh59aMwElfUP67P3fMESorVjtMwsFa0" "School Dataset") (and the @editor-link[#:public-id "0BzzMl1BJlJDkVFdlemN1UmZiR0U" "Starter file"] for this dataset)
                              }
                              @item{
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/1cIxBSQebGejWK7S_Iy6cDFSIpD-60x8oG7IvrfCtHbw" "US Income Dataset") (and the @editor-link[#:public-id "0BzzMl1BJlJDkMUxuWXNsRThBMG8" "Starter file"] for this dataset)
                              }
                              @item{
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/14er5Mh443Lb5SIFxXZHdAnLCuQZaA8O6qtgGlibQuEg" "US Presidents Dataset") (and the @editor-link[#:public-id "0BzzMl1BJlJDkNENhLXZPa1dnT28" "Starter file"] for this dataset)
                              }
                              @item{
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/1lOFsofXJNIMKAM8g4Zn688jIdbAK68ovAnzmfuwFd9M" "Countries of the World Dataset") (and the @editor-link[#:public-id "0BzzMl1BJlJDkVTJfZDhKeGRKa3c" "Starter file"] for this dataset)
                              }
                              @item{
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/1-mrDSjS-rWMdiMAIptFS_PHVUFO06lUpYNCiGkYj51s" "Music") (and the @editor-link[#:public-id "0BzzMl1BJlJDkR00tVGE0OEJJR2c" "Starter file"] for this dataset)
                              }
                              @item{
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/1HJ6wR4IH9j0hqbaP4OXeChOVMbVMyV0vBMu25NUiw1w" "State Demographics") (and the @editor-link[#:public-id "0BzzMl1BJlJDkRVU1QWpNVVpoTzg" "Starter file"] for this dataset)
                              }
                              @item{
                                  Or find your own dataset, and use this (@editor-link[#:public-id "0BzzMl1BJlJDkX0tnU0J1cTVaOHc" "Blank Starter file"]) for your project.
                              }
                          ]
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                          @activity{
                              @itemlist[
                                  @item{
                                      Once you've found a Starter file for a dataset that interests you, click "Save a Copy" and save the project to your own account. 
                                  }
                                  @item{
                                      You'll be adding to this file as we go, and keeping a written repository of your work and your findings as well. We've created @(hyperlink "https://docs.google.com/document/d/1jbKSecOtdzVO4iJsIPQRLvnwrt8GhqVFyXvnukdT_Xo/edit?usp=sharing" "a Report Starter File") for this Report as well - save a copy to your account, and be sure to @bold{bookmark the page so you can return to it later}.    
                                  }
                                  @item{
                                      Take 5 minutes to fill in your name, and fill out the "About Your Data" section in your Report.
                                  }
                              ]
                          }
                      }       
                      @teacher{
                          See the @(hyperlink "https://docs.google.com/document/d/1iS-JVNNltGY4eio8EYMMWLDQ8ntKC2qsDbtgLiSe20w/edit?usp=sharing" "Sample Report") to see an exemplar of student work.
                      }
                }
        ]
 }

@lesson/studteach[
     #:title "Closing"
     #:duration "10 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list)
     #:materials @itemlist[]
     #:preparation @itemlist[@item{}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
              @point{
                    @student{
							             Congratulations! You've just learned the basics of the Pyret programming language, and how to use that language to answer a data science question. Throughout this course, you'll learn new and more powerful tools that will allow you to answer more complex questions, and in greater detail.

							       @activity[#:forevidence "BS-IDE&1&1"]{
								            Make sure to save your work.  Hit the Save button in the top left. This will save your program in the code.pyret.org folder within your Google Drive.
    							}
    					}
                    @teacher{
							               If your students are working in pairs/groups, make sure that each student has access to a version of the program.  The student who saved the program to their Google Drive can share their program with anyone by hitting the Publish button in the top left, choosing "Publish a new copy", then clicking the "Share Link" option.  This will allow them to copy a link to the program, then send to their partners in an email/message.
					         }
              }
        ]
   }
}