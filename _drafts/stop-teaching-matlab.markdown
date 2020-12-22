---
layout: post
title:  "Stop Teaching MATLAB to Engineering Students"
description: "hello"
#date: 
categories: opinion
---

I went to school for mechanical engineering at the University of Texas. During my sophomore year, I was required to take a numerical methods course taught in MATLAB. Like many mechanical, aerospace, chemical, and civil engineering students across the United States, I learned how to use `if` statements and `for` loops, write functions, and approximate differential equations using the Runge-Kutta method. Also like many engineering students, I didn't find this material particularly inspiring. Sure, MATLAB makes it easy to analyze data and make nice graphs, but these capabilities essentially add up to a glorified version of Excel.

A few years later I tried Python and fell in love. The magic of Python for me is its versatility. Need to analyze data? Numpy and Pandas have all the capability of MATLAB and more. Want to try machine learning? All of the libraries and frameworks target Python as their primary language. Web development? Django and Flask are used for some of the biggest sites in the world. Computer Vision? OpenCV's Python bindings are, in some cases, more popular and better documented than the primary C++ interface.

When I finished my degree and went to work as a mechanical engineer, MATLAB was surprisingly ubiquitous. I saw people building huge frameworks for specialized data analysis. Writing graphical user interfaces. Developing computer vision applications. When I prototyped a computer vision application in Python and converted the logic to C++ to build into a user interface, another engineer tried to convince me to write it in MATLAB and use the C++ code generation tool instead.

In short, MATLAB is absolutely everywhere at big engineering companies where software isn't the primary product. If it can't be done in Excel, it's done in MATLAB. And because many engineering students are exposed to programming through MATLAB and nothing else, if it can't be done with MATLAB, it isn't getting done at all.

Big companies are going to do what big companies are going to do. This article is not intended as an appeal to corporate America. But I believe that MATLAB's continued popularity is detrimental to the engineering and scientific community, and that popularity is perpetuated by engineering schools teaching MATLAB to the exclusion of other environments. If you teach the students another programming language, like Python, then when they graduate and start working they'll want to use Python.

## Why MATLAB is bad for engineering

There are many reasons why MATLAB's ubiquity is a bad thing. Some of them are [technical], although I don't find those particularly compelling. MATLAB used to be much better than most languages at linear algebra and scientific computing, but the rapid development of the SciPy ecosystem has rendered any noteworthy performance gap with Python obsolete. Nowadays much of the Matlab vs. X argument, when centered around the type of programming that engineers most often do, tends to devolve into [quibbling] about syntax for linear algebra and array indexing. In my opinion, syntax is a thing to be either googled or memorized, and is most definitely not worth choosing a tool over.

So what's wrong with MATLAB, then?

**MATLAB is not a general purpose programming language.** It isn't object oriented and it isn't widely used in the tech world, meaning strong MATLAB  skills aren't particularly marketable for more software-focused jobs. Python, by comparison, is both object oriented and widely used across the software world. When I needed to build a small internal website at work, I was able to teach myself basic Web development using Django without having to learn a new programming language at the same time. When you're ready to graduate from Python to more complex languages like Java or C++ you'll have a solid grounding in object-oriented programming.

MATLAB's lack of widespread use also means there are far fewer Stack Overflow answers and blog tutorials explaining how to do xyz thing. A common complaint from MATLAB users asked to transition to Python is that "there's no one to call for support". But why do you need to call someone when you can learn how to do literally anything from the Internet? By forcing people to rely on a narrow set of resources for solving problems, MATLAB effectively serves engineers their dinner rather than teaching them to fish. Python, on the other hand, is so wildly popular that you can learn basically anything once you figure out the right keywords to Google.

**MATLAB is expensive.** So expensive, in fact, that MATLAB is essentially inaccessible for anyone who isn't an engineering student or an employee at a large enterprise. This makes it far harder to use MATLAB for personal projects, contributing to the the lack of online resources I complained about above. It also means that the only way to learn MATLAB is to join an organization that pays for it, increasing the barrier to entry in fields where MATLAB is used as a primary tool.

Python, by comparison, is free! So is almost every other general purpose programming language.

**MATLAB is not open source.** This means that the [hundreds of millions] of dollars in licensing fees paid to Mathworks every year go towards developing toolboxes and capabilities exclusively for large companies, rather than for the whole world to learn from. MATLAB has many specialized toolboxes that can be extremely useful for certain domains such as signal processing, optimization, and many others. Most of these toolboxes require not only a basic MATLAB license, but also a toolbox-specific license which can run in the hundreds of dollars.

How many people could be exposed to the cutting edge in these fields if the state of the art tools were open source? Today we see high school students doing deep learning experiments with Pytorch. In fields where MATLAB is the standard, the only way to learn is to get a degree in engineering.

For comparison, not all general-purpose programming languages are open source, but I'm not aware of any other programming environment where the library system is entirely pay-to-play.

## Why does this matter?

At first glance, it might seem like the status quo here isn't really that bad. Mathworks gives educational discounts to universities, and the big companies who use MATLAB can afford it. Do we really need an open source alternative so that high school kids can learn signal processing?

No. But the issues I outlined above are more than just missed opportunities. The gap between MATLAB and Python is just large enough to separate MATLAB users from the wider software community, isolating them from pathways like Stack Overflow, open source projects, and employee exchange through which new technologies and best practices tend to be transferred. I believe this isolation contributes to the increasingly frequent software blunders we see at legacy engineering companies. My issue with MATLAB is that it inhibits the broader engineering world from seeing software as a core competency, a skill set that should be integrated with traditional engineering disciplines like mechanical design or systems engineering.

Examples of software failures from large, traditional engineering companies have become alarmingly frequent in recent decades. The automotive industry has seen Silicon Valley make significant inroads into its market as software becomes increasingly critical to infotainment systems and self-driving capability. Toyota reached a multimillion dollar [settlement] in 2013 after embedded systems experts testified that defects in engine control software were capable of causing unintended acceleration incidents like the one that killed a woman in Oklahoma. Boeing's recent failures, from the 737 MAX disaster, to the Starliner launch failure, to the KC-46 remote vision system issues, all stem from deficiencies in the company's approach to software problems.

I'm not saying that MATLAB is to blame for these issues. The engineering world has a lot of room for improvement in its approach to safety critical software systems, and widespread Python adoption is no panacea in that regard. But moving away from MATLAB is a start. How are mechanical, aerospace, chemical, civil, and other engineers going to work successfully with software engineers if they've never been exposed to a real programming language?

## Conclusion

I took the required MATLAB course for my mechanical engineering degree at the University of Texas in 2014. As of this writing, in December 2020, it appears that the syllabi for the numerical methods courses at UT for aerospace, mechanical, and chemical engineering all reference MATLAB as the primary programming environment.

On the slim chance that you teach one of these courses, I implore you to convert it to Python. The basics are similar, and the effort will pay dividends for your student's careers.

In the more likely scenario that you're an engineer or student who uses MATLAB regularly, consider giving Python a whirl the next time you write an analysis script. The fundamental concepts you learned in MATLAB will transfer to Python, and there are lots of [guides] and [cheatsheets] available to help you make the switch. After the first few hours of frustration you'll never look back, I promise.

## Further Reading

If you're interested in a similar take on this issue from a different community, check out Olivia Guest's complaints about Matlab's use in the psychology research community in [I hate matlab]. Her argument about MATLAB's impact on the reproducibility of psychological research is less relevant to the engineering world but an important point nonetheless.

[technical]: https://tobydriscoll.net/blog/matlab-vs.-julia-vs.-python/
[I hate matlab]: https://neuroplausible.com/matlab
[quibbling]: http://www.rath.org/matlab-is-a-terrible-programming-language.html
[settlement]: https://www.latimes.com/business/la-xpm-2013-oct-25-la-fi-hy-toyota-damages-20131026-story.html
[hundreds of millions]: https://www3.bostonglobe.com/business/2018/06/18/mathworks-expansion-could-bring-new-jobs-natick-next-five-years/kkuDtuCS0ykAJXkNf4tM7N/story.html
[guides]: https://realpython.com/matlab-vs-python/
[cheatsheets]: https://cheatsheets.quantecon.org/