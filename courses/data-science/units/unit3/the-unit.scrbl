#lang curr/lib

@title{Unit 3: Measuring Center}

@declare-tags[]

@unit-overview/auto[#:lang-table (list (list "" @code{}))]{
  @unit-descr{Students learn how to measure central tendency using mean/median/mode.  They will practice calculating these values by hand, and learn to do so using Lists in Pyret}
}
@unit-lessons{

@lesson/studteach[
     #:title "Introduction"
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
                              Open the @editor-link[#:public-id "0BxJ2mGqPUGt0Zjl2Nk4yeTJzeU0" "Unit 3"] template file and click run.
                              Now that you are familiar with how tables organize data, it's time to solve some problems with them. We already know how to evaluate an identifier once a program has been run: we just type the identifier into the Interactions Area and hit "Enter" to see the value. For example, we can type the identifier @code{presidents} or @code{nutrition} into the interactions window, and we see the table. There are some other identifiers defined here - what are their names?

                      }
                      @teacher{
                              The identifiers are @code{a}, @code{b}, and @code{c}, each of which is defined to be a different List.
                      }
                }
                @point{
                      @student{
                              Let's take a look at one of these identifiers: 
                              @code[#:multi-line #t]{
                                a = [list: 1, 1, 4]
                              }
                              The value being defined is something you haven't seen before, which is neither a Number, a String, or even a table of numbers and strings. It's what is called a @italic{list}. To make a list, we use square brackets and the @code{list:} constructor, followed by a comma-separated list of values.

                              @activity{
                                In the Interactions Area, try making a few lists for practice:
                                @itemlist[
                                  @item{A list of all the days of the week}
                                  @item{A list of first 10 even numbers}
                                  @item{A list of your favorite colors}
                                ]
                              }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                            In what ways are Lists different from Tables? Tables are 2-dimensional, while Lists are 1-dimensional. Tables also have a @italic{header row}, which associates a name with each column. Lists, on the other hand, have no header.  

                            However, List do share some qualities with tables. They have multiple entries, and those entries are in a specific @italic{order}. They can also be filled with either quantitative or categorical data! 
                            @activity{
                              Look back at the three lists you created in the interactions area - are those quantitative or categorical? For practice, try constructing two lists of each kind.
                            }
                      }
                      @teacher{
                      }
                }

        ]
      }

@lesson/studteach[
     #:title "Mean, Median, and Mode"
     #:duration "30 minutes"
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
                              We encounter quantitative, 1-dimensional data all the time. Sometimes we have a list of temperatures for the day, and we want to know what the average is. Maybe we want to split a list of players into two teams, or find the most common birthday in our group of friends. All of these involve taking 1-dimensional data and asking questions about it's "center", but there are several different kinds of center. 
                      }
                      @teacher{
                              Have your students come up with other questions involving "center".
                      }
                }
                @point{
                      @student{
                        There are 3 ways to measure the "center" of a list of data: @vocab{mean}, @vocab{median} and @vocab{mode}. One of the most important questions we can ask about a column of quantitative data is:  what is the @vocab{average} value?
                      }
                      @teacher{
                              Use your favorite method of teaching the concept of averages.
                      }
                }
                @point{
                      @student{
                              We calculate the mean by adding up each element in the list, and dividing by the number of elements in that list.

                              For example, the @vocab{mean} of the list @code{[list: 1, 4, 5, 8, 2]} is calculated by @code{(1 + 4 + 5 + 8 + 2) / 5}, which evaluates to 4.
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      Open your workbooks to @worksheet-link[#:name "Mean-Median-Mode"] and practice calculating the mean of each list of Numbers by hand.  DO NOT fill in the median and mode columns yet, even if you know how!
                              }

                              Notice that calculating the @vocab{mean} requires being able to add and divide, so the @vocab{mean} only makes sense for quantitative data.  For example, the mean of a list of Presidents doesn't make sense.  Same thing for a list of zipcodes:  even though we can add and divide the numbers of zipcodes, the output doesn't correspond to some "center" zipcode.
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              It would be nice if Pyret had a way for us to compute the @vocab{mean} of any List.  What would that function be called?
                      }
                      @teacher{
                              Get students to give suggestions as to what the mean function should be called.
                      }
                }
                @point{
                      @student{
                              Type @code{mean([list: 1, 2, 3]])}.  What does this give us? Why?

                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      Type each of the following programs into the interactions window, to check your work:
                                      @itemlist[
                                              @item{
                                                    mean(a)
                                              }
                                              @item{
                                                    mean(b)
                                              }
                                              @item{
                                                    mean(c)
                                              }
                                              @item{
                                                    mean(d)
                                              }
                                      ]
                              }
                      }
                      @teacher{
                              @code{2}, which is the mean of the numbers 1, 2 and 3.
                      }
                }
                @point{
                      @student{
                              This function takes a @italic{List of Numbers} as input, and gives us the mean (a Number) as output. Write the contract for this function into your contracrs page as:

                              @code[#:multi-line #t]{# mean: List<Number> -> Number}
                              Notice that we use @code{List<Number>} to descibe "lists of numbers"!
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              The second measure of center is the @vocab{median}.  The median is the "middle" value of a list, or a value that separates the top half of a list from the bottom half.
                      }
                      @teacher{
                              
                      }
                }
                @point{
                      @student{
                              As an example, consider this list:

                              @code[#:multi-line #t]{
                                    [list: 2, 3, 1]
                              }

                              Here @code{2} is the median, because it separates the "top half" (all values greater than @code{2}, which is just @code{3}), and the "bottom half" (all values less than or equal to 2).
                      }
                      @teacher{
                              If students are not already familiar with median, we recommend the following
                              "pencil and paper algorithm" for median finding over a list:

                              @itemlist[
                                      @item{
                                            Cross out the highest number in the list.
                                      }
                                      @item{
                                            Cross out the lowest number in the list.
                                      }
                                      @item{
                                            Repeat these steps until there is only one number left in the list.  This number is the median. If there are two numbers left, take the mean of those numbers, for reasons explained in the next point.
                                      }
                              ]
                               
                      }
                }
                @point{
                      @student{
                              For lists that have an even number of elements, this question is a little trickier.

                              @code[#:multi-line #t]{
                                    [list: 2, 3]
                              }

                              There is no one number in the list separating the top half and the bottom half, because there are only 2 numbers!  In this case, we take the @vocab{mean} of the two middle numbers.  So here, the median is @code{(2 + 3) / 2} which evaluates to @code{2.5}.
                      }
                      @teacher{
                              If students are entirely unfamiliar with median, it may help them to work through several more examples of lists with even/odd sizes, before they return to the workbook assignment.
                      }
                }
                @point{
                      @student{
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                    Return to your workbook and complete the column for median values.
                              }

                              Pyret has a function to compute the median of a list as well, with the contract:

                              @code{# median: List<Number> -> Number}

                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      Test your answers in the median column with the @code{median} function.
                              }
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              The third and last measure of center is the @vocab{mode}.  The @vocab{mode} of a list is the element that appears most often in the list.

                              @code[#:multi-line #t]{
                                    [list: 1, 2, 2, 3, 4]
                              }

                              Here the mode is @code{2}, since 2 appears more than any other number.
                      }
                      @teacher{

                      }
                }
                @point{
                      @student{
                              What is the mode of this list?

                              @code[#:multi-line #t]{
                                    [list: 1, 1, 2, 3, 4, 4]
                              }

                              This list has multiple modes:  @code{1, 4}, because they appear equally often, and more than other elements in the list.

                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      Complete the final column, by calculating the mode for each example list.
                              }
                      }
                      @teacher{
                              For the examples in which a list has multiple modes, students should write in the smallest mode because that is the behavior of the @code{mode} function in Pyret, which can only return one Number, as opposed to @code{modes} which returns a List<Number>.
                      }
                }
                @point{
                      @student{
                              There are two different functions provided by Pyret:  @code{mode}, and @code{modes}.

                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      Type each of these lines of code into the interactions window. What's different about these two functions, when applied to the same List?

                                      @itemlist[
                                              @item{
                                                    mode(c)
                                              }
                                              @item{
                                                    modes(c)
                                              }
                                      ]
                              }

                              @code{mode} will return the smallest mode, which is a Number, but @code{modes} will return a List<Number> containing all of the modes.  Their contracts are:

                              @code[#:multi-line #t]{
                                    # mode : List<Number> -> Number
                                    # modes : List<Number> -> List<Number>
                              }
                      }
                      @teacher{
                              @itemlist[
                                    @item{
                                          Have students add these two contracts to their contract list.
                                    }
                                    @item{
                                          Note that later, we will reveal that @code{mode} and @code{modes}
                                          can be used on Lists of Strings as well.

                                          TODO: Do we explain generic type notation here?
                                    }
                              ]
                      }
                }
        ]
   }
@lesson/studteach[
     #:title "Extracting Lists from Tables"
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
                              Tables are 2-dimensional collections of data, but we often want to ask 1-dimensional questions of them. For example, if we ask "what is the lowest amount of sodium on the menu", or "What is biggest serving size possible", these are questions that @italic{only involve one column at a time}.  We need some way of looking at each column individually in our programs.  In other words, we often want to get 1-dimensional data @bold{out} of a 2-dimensional table.

                      }
                      @teacher{
                              
                      }
                }
                @point{
                      @student{
                              The @vocab{extract} operation does just that!

                              @code[#:multi-line #t]{
                                  sodium-list = extract sodium from nutrition end
                              }

                              @activity{What is the name of the identifier being defined here? What do you think its value is?}
                              After running this program, typing @code{sodium-list} into the interactions window and hitting Return gives us the following list: @code{[list: 480, 680, 820, 360, 1300, 790, 160, 150, 680, 130]}.
                      }
                      @teacher{
                      
                      }
                }
                @point{
                      @student{
                              Let's examine this line of code, piece by piece.

                              @itemlist[
                                      @item{
                                            @code{extract} tells Pyret that we want to take a particular column out of a table. 
                                      }
                                      @item{
                                            After the @code{extract} keyword, we choose the name of 1 column we want 
                                            to see as a list.  In this case, it is the @code{sodium} column.
                                      }
                                      @item{
                                            Then, the @code{from} keyword, which indicates which table we are extracting the column from.  Following this is the table name, which is @code{nutrition}.
                                      }
                                      @item{
                                            Finally, an @code{end} keyword tells Pyret that our line of code involving a table is done.
                                      }
                              ]


                      }
                      @teacher{
                              This is the first example of an expression that consumes a table that students will need to write for themselves.  These expressions (@code{extract, sieve, select, order}, and @code{extend}) have fundamentally different syntax than programs they have seen with arithmetic or function application.
                      }
                }
                @point{
                      @student{
                              @vocab{lists} are a new type:  they are collections of values.  Whereas tables are 2-dimensional collections of values, lists are 1-dimensional collections of values.

                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      Back in the @editor-link[#:public-id "0BxJ2mGqPUGt0Zjl2Nk4yeTJzeU0" "Unit 3"] template file, 
                                      add code to the definitions area to extract the following columns as lists:

                                      @itemlist[
                                              @item{
                                                    Define a list called @code{party-list} that contains the @code{party} column from @code{presidents}.
                                              }
                                              @item{
                                                    Define a list called @code{calories-list} containing the @code{calories} column from @code{nutrition}.
                                              }
                                              @item{
                                                    Define a list called @code{gdp-list} containing the @code{gdp} column from @code{countries}.
                                              }
                                              @item{
                                                    Define a list called @code{life-expectancy-list} that contains the @code{median-life-expectancy} column from @code{countries}.
                                              }
                                      ]

                                      Notice that these Lists contain just one type of data: either only Strings, or only Numbers.
                              }
                      }
                      @teacher{
                              TODO add usage of the lifespan dataset
                      }
                }
        ]
}

@lesson/studteach[
     #:title "Which Measure is Best?"
     #:duration "15 minutes"
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
                              After completing @worksheet-link[#:name "Mean-Median-Mode"] in your workbook, you may have noticed that the @vocab{mean}, @vocab{median}, and @vocab{mode} are rarely the same value.  So, which one should we use, and when?
                      }
                      @teacher{
                              For each of the following example lists, discuss with the students what the strengths/weaknesses of each measurement.
                      }
                }
                @point{
                      @student{
                              Imagine that a math teacher is tracking their students' grades.  Here are the students' grades on the first test.

                              @code[#:multi-line #t]{
                                    [list: 68, 64, 62, 100, 100, 68, 67]
                              }
                              Which measure of center gives the best indication of how the class did?
                              @itemlist[
                                      @item{
                                            mean:  @code{75.57}
                                      }
                                      @item{
                                            median:  @code{68}
                                      }
                                      @item{
                                            mode:  @code{69}
                                      }
                              ]
                              Notice that the mean is well over 75, even though most of the students scored below 70! The mean here is more affected by @italic{outliers}: those two 100s are bringing the average up. This is because mean is calculated using every value in the list, while the median is calculated with at most 2 values from the list.
                      }
                      @teacher{
                              
                      }
                }
                @point{
                      @student{
                              Here is a different list of student grades, from their second test.

                              @code[#:multi-line #t]{
                                    [list: 68, 68, 89, 91, 88, 93, 92]
                              }

                              @itemlist[
                                      @item{
                                            mean:  @code{84.14}
                                      }
                                      @item{
                                            median:  @code{89}
                                      }
                                      @item{
                                            mode:  @code{68}
                                      }
                              ]
                      }
                      @teacher{
                              Highlight that even though 68 appears more than any one number, most of the scores are concentrated around ~90.
                      }
                }
                @point{
                      @student{
                              Grades on the students' 3rd test:

                              @code[#:multi-line #t]{
                                    [list: 94, 96, 98, 85, 82, 70, 71]
                              }

                              @itemlist[
                                      @item{
                                            mean:  @code{85.14}
                                      }
                                      @item{
                                            median:  @code{85}
                                      }
                                      @item{
                                            modes:  @code{94, 96, 98, 85, 82, 70, 71}
                                      }
                              ]
                      }
                      @teacher{
                              Highlight that, since all of the values are distinct, the mode is less useful than the median or mode.
                      }
                }
                @point{
                      @student{
                              The teacher just gave the students their fourth test, and here is the list of grades:

                              @code[#:multi-line #t]{
                                    [list: 98, 96, 98, 85, 70, 70, 71]
                              }

                              @itemlist[
                                      @item{
                                            mean:  @code{84}
                                      }
                                      @item{
                                            median:  @code{85}
                                      }
                                      @item{
                                            modes:  @code{70, 98}
                                      }
                              ]
                      }
                      @teacher{
                              Highlight that the mean and median are both weaker measures here, because the scores are clustered in two groups around the modes.
                      }
                }
                @point{
                      @student{
                              In general, here are some guidelines for when to use one measurement over the other:

                              @itemlist[
                                      @item{
                                            If the data is unlikely to have values occurring multiple times (like with decimals, or with grades), do not use mode.
                                      }
                                      @item{
                                            If the data is more "course grained", meaning the data is quantitative but there are only a small number of possible values each entry can take, then mode will be useful.
                                      }
                                      @item{
                                            If the data is going to have lots of outliers, then median gives a better estimate of the center than mean.
                                      }
                              ]
                      }
                      @teacher{

                      }
                }

        ]
   }

@lesson/studteach[
     #:title "More Practice in Pyret"
     #:duration "15 minutes"
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
                              @activity[#:forevidence "BS-IDE&1&1"]{
                                      Turn to @worksheet-link[#:name "Measuring-Center"] in your workbooks and complete all of the questions, using your Pyret program.
                              }
                      }
                      @teacher{
                              @itemlist[
                                      @item{
                                            This exercise gives students more practice using Pyret to compute mean/median/mode.  Students will also see first hand that calculating a median of medians of many lists is not necessarily the same as the median of a larger list.
                                      }
                                      @item{
                                            After all the students complete this workbook page, discuss the implications of this for the countries table. Taking the median of the @code{median-life-expectancy} column is an inaccurate measure of the median life expectancy of humans all over the world.  The most accurate measure of median human life expectancy would require a table with every human as a row.
                                      }
                                      @item{
                                            The punchline of this portion of the exercise is: don't take the median of medians.
                                      }
                              ]
                      }
                }
        ]
   }

}

