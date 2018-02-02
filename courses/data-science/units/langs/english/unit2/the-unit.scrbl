#lang curr/lib

@title{Unit 2: Defining Values and Functions }

@unit-overview/auto[#:lang-table (list (list "Number" 
                                              @code{num-sqrt, num-sqr} 
                                              @code{4, -1.2. 2/3})
                                       (list "String" 
                                              @code{string-repeat, string-contains} 
                                              (list @code{"hello" "91"} ))
                                       (list "Boolean" 
                                              @code{} 
                                              (list @code{true false} ))
                                       (list "Image" 
                                              @code{triangle, circle, star, rectangle, ellipse, square, text, overlay} 
                                              (list @bitmap{images/imgValue1.png} @bitmap{images/imgValue2.png}))
                                       )]{
  @unit-descr{
    Students choose their dataset, and begin to explore. In the process, they learn how to write their own definitions, first defining static values and then complete functions. They are also introduced to the Design Recipe: a structured approach to solving word problems and defining functions.
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
                            Let's take a look at a real dataset!
                            @activity[#:forevidence (list )]{
                                @itemlist[
                                    @item{
                                        Open the @(hyperlink "https://docs.google.com/spreadsheets/d/19m1bUCQo3fCzmSEmWMjTfnmsNIMqiByLytHE0JYtnQM/" "Animals Spreadsheet") in a new tab. Take a moment to look around. What do you think this table is for?
                                    }
                                    @item{
                                        This is some data from an animal shelter, listing animals that have been adopted. We'll be using this as an example throughout the course, but you'll be applying what you learn to @italic{a dataset you choose} as well.
                                    }
                                    @item{
                                        Open up the @editor-link[#:public-id "0BzzMl1BJlJDkYkhKMG51VlRiWk0" "Animals Dataset"] starter file in a new tab. Click "Connect to Google Drive" to sign into your Google account, and then click the "Save as" button. This will save a copy of the file into your own account, so that you can make changes and retrieve them later.
                                    }
                                ]
                            }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                            This file contains some new code that you haven't seen before. As with our Shapes file, we have a few @code{include} lines which import useful libraries for our course. This time, we also include a library that lets us work with Google Sheets:
                            @code[#:multi-line #t]{
                              include gdrive-sheets
                              include tables
                              include image
                            }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                            On line 9, the @code{load-spreadsheet} function is used to load our animal shelter spreadsheet from Google Drive, and give that file a name: @code{shelter-sheet}. After that, we see the following code:
                            @code[#:multi-line #t]{
                              # load the 'pets' sheet as a table called animals
                              animals-table = load-table: name, species, age, fixed, legs
                                source: pets-sheet.sheet-by-name("pets", true)
                              end
                            }
                            Just as you saw with our @code{shapes} example, this code @italic{defines a new table}. This time, it's called @code{animals-table}, and it's loaded from our Google Sheet. On line 12, you can see the names we are giving to each of the columns, called @code{name}, @code{species}, @code{gender}, @code{age}, @code{fixed}, @code{legs}, @code{pounts} and @code{weeks}.
                      }
                      @teacher{
                            Have students look back at the column names in the Google Sheet, and in the @code{load-table} function. Point out that they refer to the same columns, even though they have different names!
                      }
                }
                @point{
                      @student{
                            Click "Run", and type @code{animals-table} into the Interactions Area to see what this table looks like.
                            @itemlist[
                              @item{How many columns does this table have?}
                              @item{For each column, is the data quantitative or categorical? }
                              @item{For each column, what datatype is being used? Numbers? Strings? Images? Booleans? }
                              @item{How could you get row for the animal named "Toggle"? }
                              @item{How could you get the age of the animal named "Toggle" from that row? }
                              @item{How could you get the species of the animal named "Fritz"? }
                              @item{How could you get the number of legs of the animal named "Mittens"? }
                            ]
                      }
                      @teacher{
                            Use the last four questions to review @code{get-row} and row-accessors (introduced in Unit 1) before proceeding. Review with the whole class.
                      }
                }
                @point{
                      @student{
                            Turn to @worksheet-link[#:name "Animals-Dataset"] in your Student Workbook, and fill in the table in Question 2.
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                            Are cats more popular than dogs? Do older animals take longer to get adopted? What are some questions someone might have about this dataset? Write down three questions you have on @worksheet-link[#:name "Animals-Dataset"].
                      }
                      @teacher{

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
     #:standards (list "BS-PL.3")
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
                        As you've seen, Pyret allows us to define names for values using the @code{=} sign. In math, you're probably used to seeing definitions like @math{x = 4}, which defines the name @code{x} to be the value @code{4}. Pyret works the same way, and you've already seen two names defined in this file: @code{shelter-sheet} and @code{animals-table}. We generally write definitions on the left, in the Definitions Area.
                        You can add your own definitions, for example:
                        @code[#:multi-line #t]{
                            name = "Nancy"
                            sum = 2 + 2
                            img = triangle(10, "solid", "red")
                        }
                        @activity[#:forevidence (list "BS-PL.3&1&1")]{
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
                        Each row of our @code{animals-table} represents a single animal in our shelter. We can use the @code{get-row} function from yesterday to define values. Type the following lines of code into the Definitions Area and click "Run":
                        @code[#:multi-line #t]{
                          mittens = get-row(animals-table, 3) # the Row for Mittens
                          fritz   = get-row(animals-table, 10) # the Row for Fritz
                        }
                        What happens when you evaluate @code{mittens} in the Interactions Area?
                        @activity[#:forevidence (list "BS-PL.3&1&1")]{
                            Define values for mittens and sasha. Then, select two pets from the @code{animals-table} that you would most like to adopt, and two more than you would @italic{least} like to adopt (don't worry, those animals will find homes too!). What rows are they? Define four additional values for these animals, using the pet's names and rows.
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
     #:standards (list "BS-DR.1" "BS-DR.2" "BS-PL.3")
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
                                @item{What kind of animal is it?}
                                @item{Has it been fixed?}
                                @item{When was it born?}
                                @item{Is it a kitten?}
                              ]
                        }
                        @teacher{
                            Have students brainstorm additional questions!
                        }
                }
                @point{
                      @student{
                            Suppose I want to know if @code{mittens} is fixed or not.
                            @activity{Quick! Is mittens fixed? Describe what you did to find the answer.}
                            We know lots of functions in Pyret that can handle Numbers, Strings, Images and so on, but none that can handle animals! @bold{We need to build our own.}
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                            To build our own functions, we'll use something called the @bold{Design Recipe}. The Design Recipe is a way to think through the behavior of a function, to make sure we don't make any mistakes with the animals that depend on us! The Design Recipe has three steps, and we'll go through them together for our first function. 
                            @activity{
                              Turn to page @worksheet-link[#:name "Design-Recipe-1"] in your Student Workbook.
                            }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                            @bannerline{Step 1: Contract and Purpose} The first thing we do is write a Contract for this function. You already know a lot about contracts: they tell us the Name, Domain and Range of the function. Our function tells us if an animal is fixed or not, so we'll call it @code{is-fixed}. It consumes an animal (represented by a @code{Row} in our table), and produces a @code{Boolean}: @code{true} if the animal is fixed, and @code{false} if it isn't. A Purpose Statement is just a description of what the function does:
                            @code[#:multi-line #t]{
                              is-fixed :: (animal :: Row) -> Boolean
                              # Consumes an animal, and produces the value in the fixed column
                            }
                      }
                      @teacher{
                        Be sure to check students' contracts and purpose statements before having them move on!
                      }
                }
                @point{
                      @student{
                            @bannerline{Step 2: Write Examples} You already know how to write examples for built-in functions, where we write the @italic{answer} we expect to get back. Just as we did before, we start with the name of the function we're writing, followed by an example input. Let's use some two pets we defined earlier for our first example.
                            @code[#:multi-line #t]{
                              is-fixed :: (animal :: Row) -> Boolean
                              # Consumes an animal, and produces the value in the fixed column
                              examples:
                                is-fixed(sasha) is false
                                is-fixed(fritz) is true
                              end
                            }
                      }
                      @teacher{
                            Make sure students understand (1) that @code{is-fixed} came from the Name in our contract, (2) that @code{sasha} and @code{fritz} came from the Domain in our contract, that (3) @code{sasha["fixed"]} came from our purpose statement, and the label also came from the variable name in our contract.
                      }
                }
                @point{
                      @student{
                            When testing functions we write ourselves, we don't just want to put down the answers. We want to @italic{show our work}, to make sure we have a clear sense for how the function will do it's job. To find out if @code{sasha} was fixed, we had to access the @code{fixed} column for that row. 
                            @activity{
                              Let's re-write those examples to show that:
                              @code[#:multi-line #t]{
                                is-fixed :: (animal :: Row) -> Boolean
                                # Consumes an animal, and produces the value in the fixed column
                                examples:
                                  is-fixed(sasha) is sasha["fixed"]
                                  is-fixed(fritz) is fritz["fixed"]
                                end
                              }
                            }
                      }
                      @teacher{
                            Make sure students see that the re-written examples are @italic{equivalent}, and that the new code accurately represents what the students themselves did to seek out the values in the columns: access the @code{fixed} row.
                      }
                }
                @point{
                      @student{
                            @activity[#:forevidence (list "BS-PL.3&1&2")]{
                                @itemlist[
                                  @item{
                                      In the examples where we show our work, do you notice a pattern? Most of the code for these examples is exactly the same, and only a small bit is changing: @code{sasha} and @code{fritz}.
                                  }
                                  @item{
                                      Circle all of the parts in your example block that are changing.
                                  }
                                  @item{
                                      What does the stuff you circled represent? Are @code{sasha} and @code{fritz} years? Legs? No - they are @italic{animals}! Let's label them...
                                  }
                                ]
                                  
                            }
                      }
                      @teacher{
                            
                      }
                }
                @point{
                    @student{
                          @bannerline{Step 3: Define the Function} After having written our examples, this part is easy! The part of the examples before @code{is} tells us how to begin. We start with the @code{fun} keyword (short for "function"), followed by the name of our function and a set of parentheses. This is exactly how all of our examples started, too. But instead of writing @code{mittens}, we'll use the @italic{label} that we gave it. Then we add a colon (@code{:}) in place of @code{is}, and continue to follow our examples, replacing anything we circled with the label. Finally, we finish with the @code{end} keyword.
                          @code[#:multi-line #t]{
                              is-fixed :: (animal :: Row) -> Boolean
                              # Consumes an animal, and produces the value in the fixed column
                              examples:
                                is-fixed(sasha) is sasha["fixed"]
                                is-fixed(fritz) is fritz["fixed"]
                              end
                              fun is-fixed(animal): 
                                animal["fixed"]
                              end
                            }
                    }
                    @teacher{

                    }
                }
                @point{
                    @student{
                          Now that we've defined our function, we can click "Run" and actually use it!
                          @activity[#:forevidence (list "BS-PL.3&1&3")]{
                              After you've clicked run, try typing in the following expressions, and see what happens:
                              @code[#:multi-line #t]{
                                  is-fixed(sasha)
                                  is-fixed(fritz)
                                  is-fixed(get-row(animals-table, 8))
                                  is-fixed(get-row(animals-table, 11))
                              }
                          }
                    }
                    @teacher{

                    }
                }
                @point{
                    @student{
                        Our @code{examples:} block is a helpful way to @italic{check our work}, so we don't make mistakes. Suppose we made a mistake in our function definition, and accessed the wrong column:
                        @code[#:multi-line #t]{
                            fun is-fixed(animal): 
                              animal["age"]
                            end
                        }
                        When we click "Run", the computer will tell us that our examples don't match the definition! It will iterally @italic{check your work for you!}
                    }
                    @teacher{

                    }
                }
                @point{
                    @student{
                        So far, our functions have been pretty simple: they consume a row, and they produce one column from that row as-is. But supposed we want to @italic{use} that value to find out specifically whether or not an animal is a cat, or whether it's a child? Let's walk through a more complex Design Recipe together, by turning to @worksheet-link[#:name "Design-Recipe-2"].
                    }
                    @teacher{

                    }
                }
                @point{
                    @student{
                        @activity[#:forevidence (list "BS-PL.3&1&1" "BS-PL.3&1&2"  "BS-PL.3&1&3")]{
                          Define a function called @code{is-cat}, which consumes a row from the @code{animals-table} and returns true if the animal is a cat.
                          @itemlist[
                            @item{ What is the name of this function? What are it's Domain and Range? }
                            @item{ Is Sasha a cat? @italic{What did you do to get that answer?} }
                            ]
                        }
                    }
                    @teacher{
                        Have students explain their thinking carefully, step-by-step. Repeat this with other animals.
                    }
                }
                @point{
                    @student{
                        To find out if an animal is a cat, we look at the @code{species} column and check to see if that value is @italic{equal to} @code{"cat"}. This gives us out first example:
                        @code[#:multi-line #t]{
                              is-cat :: (animal :: Row) -> Boolean
                              # Consumes an animal, and produces true if the animal is a cat
                              examples:
                                is-cat(sasha) is sasha["species"] == "cat"
                              end
                            }
                        @activity{ Add a second example, this time for an animal that is @italic{not} a cat. }
                    }
                    @teacher{
                        Have students share their examples. Point out that the code is the same for all examples, aside from the name of the animal being tested.
                    }
                }
                @point{
                    @student{
                        Just we've done before, let's look at our examples and circle the things that are change from one to the other.
                        @itemlist[
                          @item{ Do all our examples use @code{is-cat}? }
                          @item{ Do all our examples use the same inputs? }
                          @item{ Do all our examples look at the same column? }
                          @item{ Do all our examples compare that column value to "cat"? }
                        ]
                        @activity{ What label should we use here? }
                    }
                    @teacher{
                        Make sure students realize that the label is specified in the Domain.
                    }
                }
                @point{
                    @student{
                        As before, we'll use the pattern from our examples to come up with our definition.
                        @itemlist[
                          @item{ What is the function name? }
                          @item{ What is the name of the variable(s)? }
                          @item{ What do we do in the body in the function? }
                        ]
                        @code[#:multi-line #t]{
                              is-cat :: (animal :: Row) -> Boolean
                              # Consumes an animal, and produces true if the animal is a cat
                              examples:
                                is-cat(sasha)   is sasha["species"]   == "cat"
                                is-cat(mittens) is mittens["species"] == "cat"
                              end
                              fun is-cat(animal): 
                                animal["species"] == "cat"
                              end
                            }
                    }
                }
                @point{
                    @student{
                        @activity{
                          Type this definition - and its examples! - into the Definitions Area, then click "Run" and try using it.
                        }
                    }
                }
                @point{
                    @student{
                        Now let's practice writing functions that @italic{do things} to their input. This time, you'll have to write the Contract, Purpose Statement, and first example yourself!
                        @activity[#:forevidence (list "BS-PL.3&1&1" "BS-PL.3&1&2"  "BS-PL.3&1&3")]{
                          Use the bottom half of @worksheet-link[#:name "Design-Recipe-2"] to solve the following problems:
                          @itemlist[
                              @item{ 
                                  Define a function called @code{is-young}, which consumes a Row of the @code{animals-table} and produces @code{true} if its @code{age} is less than 2.
                              }
                          ]
                        }
                    }
                    @teacher{
                          Show students that they can combine all their examples into a single block at the top of the file.
                    }
                }
                @point{
                    @student{
                        @activity[#:forevidence (list "BS-DR.1&1&1" "BS-DR.1&1&2"  "BS-DR.2&1&1" "BS-DR.2&1&2")]{
                          Turn to @worksheet-link[#:name "Design-Recipe-3"], and see if you can solve the following word problems:
                            @itemlist[
                              @item{ 
                                  Define a function called @code{nametag}, which prints out each animal's name in big red letters.
                              }
                              @item{ 
                                  Define a function called @code{is-kitten}, which consumes a Row of the @code{animals-table} and produces @code{true} if it's a cat @italic{and} is less than 2 years old.
                              }
                            ]
                          }
                    }
                    @teacher{
                      OPTIONAL: Show students how to write @code{is-kitten} @italic{using} the @italic{is-cat} and @code{is-young} functions they defined before. 
                    }
                }
        ]
  }

  @lesson/studteach[
     #:title "Choose Your Dataset"
     #:duration "25 minutes"
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
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/1SaR2M6Z-s40UuRg3u1aQU-G1GVdcm0RgHpqQ9LNmSQk" "Movies Dataset") (and the @editor-link[#:public-id "1KaHf2DSd5iJ17UsRd61jljsWR_HqRQY2" "Starter file"] for this dataset)
                              }
                              @item{
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/1yHPM-poscv6azh59aMwElfUP67P3fMESorVjtMwsFa0" "School Dataset") (and the @editor-link[#:public-id "1371QVz9uLJKCiX_Q3bR93ZZ5EKhAxZoR" "Starter file"] for this dataset)
                              }
                              @item{
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/1cIxBSQebGejWK7S_Iy6cDFSIpD-60x8oG7IvrfCtHbw" "US Income Dataset") (and the @editor-link[#:public-id "1lVDBQiAze_NjH69rWcFi15ApbNPZWXOk" "Starter file"] for this dataset)
                              }
                              @item{
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/14er5Mh443Lb5SIFxXZHdAnLCuQZaA8O6qtgGlibQuEg" "US Presidents Dataset") (and the @editor-link[#:public-id "18Ux-O_c78jnZ4cFjTwvaZzaBJOch9cTK" "Starter file"] for this dataset)
                              }
                              @item{
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/1lOFsofXJNIMKAM8g4Zn688jIdbAK68ovAnzmfuwFd9M" "Countries of the World Dataset") (and the @editor-link[#:public-id "1V1u_kINuc6PCOWZ0WF7a2oZSLbrzRitg" "Starter file"] for this dataset)
                              }
                              @item{
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/1-mrDSjS-rWMdiMAIptFS_PHVUFO06lUpYNCiGkYj51s" "Music") (and the @editor-link[#:public-id "1EHpLimHbsZkSie23Dt-COhTDtNQ0_g1Z" "Starter file"] for this dataset)
                              }
                              @item{
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/1HJ6wR4IH9j0hqbaP4OXeChOVMbVMyV0vBMu25NUiw1w" "State Demographics") (and the @editor-link[#:public-id "1okOF06x6_UtMgnM8yi6dIGH6ZfBrpEQM" "Starter file"] for this dataset)
                              }
                              @item{
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/182UAmtxaBjIY3cGB9fy8tsl1q3ZJ0fcP4m38i9Sr5l0" "New York City Restaurant Health Inspections") (and the @editor-link[#:public-id "https://code.pyret.org/editor#share=1HpAIsC_3sDWYgtIj0iwgch81MllIa-Yy" "Starter file"] for this dataset)
                                   }
                              @item{
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/1F5Q2HwyhrhzMBivKNA2qpgUroqGWpDTUKcF3p82pVDA" "Pokemon Dataset") (and the @editor-link[#:public-id "https://code.pyret.org/editor#share=1h3pCuuc0AchFZidLV-9553kGhpRKyYxP" "Starter file"] for this dataset)
                                   }
                              @item{
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/126sJLFP8kenombJx5CtR-9D88jgbI_vKlYq30PWT41g" "IGN Video Game Reviews Dataset") (and the @editor-link[#:public-id "https://code.pyret.org/editor#share=1H3-aDMoCNCJtRoUpJfPFRUy2JuhmBNFJ" "Starter file"] for this dataset)
                                   }
                              @item{
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/1WMJMNqkwuo1vbL0O_C81BPA-R2TFcLWEMUi7cn_ptow" "2016 Presidential Primary Election Dataset") (and the @editor-link[#:public-id "https://code.pyret.org/editor#share=1U_R0ZoRRvUwKy58m9cgJ6AyDHWW1Oh7-" "Starter file"] for this dataset)
                                     }
                              @item{
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/1Fyp-h8sSggYPHIpvrtBzSrKGa6bZioy1lMTKIC--RH0" "US Cancer Rates Dataset") (and the @editor-link[#:public-id "https://code.pyret.org/editor#share=1Kd9Zi4Z0jKkyxV7rHCw4nNQqbhgpT2Qi" "Starter file"] for this dataset)
                                     }
                              @item{
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/19bmTJd2soUvg6FUDIW546jPtiWOERFm2o9z7TLBNTbc" "Summer Olympic Medals Dataset") (and the @editor-link[#:public-id "https://code.pyret.org/editor#share=1HubbGjtE96e3wt0EZqlVWtKstmyPpDd_" "Starter file"] for this dataset)
                                     }
                              @item{
                                  @(hyperlink "https://docs.google.com/spreadsheets/d/1ZJ9d4BtF6xOqyBdGgjW-vCeJ7-rOHWIhGMiBNwqCEVo" "Winter Olympic Medals Dataset") (and the @editor-link[#:public-id "https://code.pyret.org/editor#share=1QvKr16tceg0wQ9vLfu-iFiZEpUdw5I2L" "Starter file"] for this dataset)
                                     }

                              @item{
                                @(hyperlink "https://docs.google.com/spreadsheets/d/157Bi2kniAJybuV1X_9h4Z6DaZSVPK3vPf697feXcyv8" "MLB Hitting Stats Dataset") (and the @editor-link[#:public-id "https://code.pyret.org/editor#share=1_d80_yLylUXz32QrEsN9EjtHEHJ8gB34" "Starter file"] for this dataset)
                                     }
                              @item{
                                  Or find your own dataset, and use this (@editor-link[#:public-id "1sRPS3wuExqrRE0aw-TnqVv25frjBBwii" "Blank Starter file"]) for your project.
                              }
                          ]
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                          @activity[#:forevidence (list )]{
                              @itemlist[
                                  @item{
                                      Once you've found a Starter file for a dataset that interests you, click "Save a Copy" and save the project to your own account. 
                                  }
                                  @item{
                                      Take 5 minutes to fill in your name, and complete @worksheet-link[#:name "My-Dataset"].
                                  }
                              ]
                          }
                      }       
                      @teacher{
                      
                      }
                }
        ]
  }

  @lesson/studteach[
     #:title "Closing"
     #:duration "5 minutes"
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
							             Building functions is a powerful technique, which you'll use throughout the course. Today, you learned how to write functions that work on one row of a table at a time. In the next lesson, you'll learn how to use those functions to loop over an @italic{entire table}, letting us extend, filter, and sort our @code{animals-table}

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
