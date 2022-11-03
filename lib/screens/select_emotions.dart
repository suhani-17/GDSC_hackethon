import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wellbook/screens/pdf_view.dart';

class GetEmotion extends StatefulWidget {
  const GetEmotion({
    Key? key,
  }) : super(key: key);

  @override
  State<GetEmotion> createState() => _GetEmotionState();
}

class _GetEmotionState extends State<GetEmotion> {
  TextEditingController text = TextEditingController();
  String t = "";
  var data = {
    "fear": [
      {
        "book name": "Social Anxiety",
        "author": "Brian Adams",
        "description":
            "If you are suffering from social anxiety disorder, if you feel that others are judging you for being nervous, shy or fearful of a situation then you have come to the right place.Gain an understanding of what social anxiety is and what a person who has it may be feeling, as well some techniques on how to overcome it. Please understand, these techniques are not just a one off; they are proven to work with lasting benefit and efficacy.",
        "coverImage":
            "https://m.media-amazon.com/images/I/41pvZPZsPUL._SX331_BO1,204,203,200_.jpg",
        "bookLink":
            "https://www.pdfdrive.com/social-anxiety-ultimate-guide-to-overcoming-fear-shyness-and-social-phobia-to-achieve-success-in-all-social-situations-e195208833.html"
      },
      {
        "book name": "How to turn fear into confidence",
        "author": "TW Walker",
        "description":
            "Fear is one of the most lethal adversaries of anyone, particularly those who are small business owners and aspiring entrepreneurs. In the Superhero Success expanding series of books and ebooks, small business coach TW Walker provides the core of his business mentoring advice with a breakdown of overcoming fear, how it debilitates growth, and how to contain it forever with - How To Turn Fear Into Confidence.",
        "coverImage":
            "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1385525550i/18994857.jpg",
        "bookLink":
            "https://www.pdfdrive.com/how-to-turn-fear-into-confidence-the-ultimate-guide-to-conquering-fear-e165191405.html"
      },
      {
        "book name": "Fight The fear",
        "author": "Mandie Holgate",
        "description":
            "Fight the Fear will help you get the results you want so you can overcome your fears one step at a time and gain the respect you deserve.",
        "coverImage": "https://m.media-amazon.com/images/I/41oU8L93B1L.jpg",
        "bookLink":
            "https://www.pdfdrive.com/fight-the-fear-how-to-beat-your-negative-mindset-and-win-in-life-e186519649.html"
      },
      {
        "book name": "The Courage Habit",
        "author": "Kate Swoboda",
        "description":
            "What kind of life would you live if you didn't allow your fears to hold you back? The Courage Habit offers a powerful program to help you conquer your inner critic, work toward your highest aspirations, and build a courageous community",
        "coverImage": "",
        "bookLink":
            "https://www.pdfdrive.com/the-courage-habit-how-to-accept-your-fears-release-the-past-and-live-your-courageous-life-e158260544.html"
      },
      {
        "book name": "13 Things Mentally Strong People Do",
        "author": "Amy Morin",
        "description":
            "Everyone knows that regular exercise and weight training lead to physical strength. But how do we strengthen ourselves mentally for the truly tough times? And what should we do when we face these challenges? Or as psychotherapist Amy Morin asks, what should we avoid when we encounter adversity? Through her years counseling others and her own experiences navigating personal loss, Morin realized it is often the habits we cannot break that are holding us back from true success and happiness.",
        "coverImage": "https://www.storytel.com/images/640x640/0000839652.jpg",
        "bookLink":
            "https://www.pdfdrive.com/13-things-mentally-strong-people-dont-do-take-back-your-power-embrace-change-face-your-fears-and-train-your-brain-for-happiness-and-success-e163207934.html"
      }
    ],
    "sad": [
      {
        "book name": "You Are a Badass",
        "author": "Jen Sincero",
        "description":
            "YOU ARE A BADASS IS THE SELF-HELP BOOK FOR PEOPLE WHO DESPERATELY WANT TO IMPROVE THEIR LIVES BUT DON'T WANT TO GET BUSTED DOING IT.",
        "coverImage": "https://m.media-amazon.com/images/I/51LrZ2xk5eL.jpg",
        "bookLink":
            "https://www.pdfdrive.com/you-are-a-badass-how-to-stop-doubting-your-greatness-and-start-living-an-awesome-life-e60365112.html"
      },
      {
        "book name": "How To Stop Worrying And Start Living",
        "author": "Shahid Riaz, Dale Carnegie",
        "description":
            "How to Stop Worrying and Start Living deals with fundamental emotions and ideas. It is fascinating to read and easy to apply. Let it change and improve you. There's no need to live with worry and anxiety that keep you from enjoying a full, active and happy life!",
        "coverImage":
            "data:image/jpeg;base64,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",
        "bookLink":
            "https://www.pdfdrive.com/how-to-stop-worrying-and-start-living-e20577445.html"
      },
      {
        "book name": "Ikigai",
        "author": "Hector Garcia, France Miralles, Heather Cleary",
        "description":
            "The people of Japan believe that everyone has an ikigai - a reason to jump out of bed each morning. And according to the residents of the Japanese island of Okinawa-the world's longest-living people-finding it is the key to a longer and more fulfilled life.",
        "coverImage": "https://m.media-amazon.com/images/I/81l3rZK4lnL.jpg",
        "bookLink":
            "https://www.pdfdrive.com/ikigai-the-japanese-secret-to-a-long-and-happy-life-e195091541.html"
      },
      {
        "book name": "Law of Attraction",
        "author": "Julie Yoakum",
        "description":
            "Can you really attract more love, money, and happiness by simply thinking a certain way? This answer is yes! In the book, you'll learn the secret to attracting everything you've ever wanted in life. Once you understand the Law of Attraction, you'll experience greater joy, better health, quality relationships, and unlimited money. This book will give you everything you need to understand the Law of Attraction and a step-by-step process on how to apply it to your everyday life. You'll get a better sense of how your relationships, health issues, finances, career concerns, and other aspects of life are influenced by this universal law.",
        "coverImage":
            "data:image/jpeg;base64,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",
        "bookLink":
            "https://www.pdfdrive.com/law-of-attraction-how-to-attract-money-love-and-happiness-e439355.html"
      },
      {
        "book name": "The Happiness Hack",
        "author": "Ellen Petry Leanse",
        "description":
            "For years, Ellen Leanse worked with the biggest technology titans that fight for our attention, including Apple, Facebook, Google, and Microsoft… programming habits that revolved around our devices. By mapping how the mind works, innovators like Ellen are able to ingrain habits for all of us, revolving around our technology. But what if we could instead create habits that revolve around happiness?In this refreshing, practical book, you'll learn Ellen's proven methods to hack your mind in order to: • Stop living your life on auto pilot • Reclaim focus for the things that matter • Have more time to do things you love • Create real connections to the world around you • And most importantly, REDUCE STRESSBy the end of The Happiness Hack, you'll be back in control of your mind and living the life you wish to live. Only you can define your happiness ― take control today!",
        "coverImage":
            "https://m.media-amazon.com/images/I/412YeOVp40L._SX317_BO1,204,203,200_.jpg",
        "bookLink":
            "https://www.pdfdrive.com/the-happiness-hack-how-to-take-charge-of-your-brain-and-program-more-happiness-into-your-life-e182188630.html"
      }
    ],
    "happy": [
      {
        "book name": "Flourish",
        "author": "Martin Seligman",
        "description":
            "Flourish builds on Dr Seligman's game-changing work on optimism, motivation and character to show how to get the most out of life, unveiling an electrifying new theory of what makes a good life - for individuals, for communities and for nations.",
        "coverImage": "https://m.media-amazon.com/images/I/51IecFSy4bL.jpg",
        "bookLink":
            "https://drive.google.com/file/d/1iFu4KJLfmzy5_1m_LgvlV1k_g_3FH8VM/view?usp=sharing"
      },
      {
        "book name": "The Art Of Happiness",
        "author": "The Dalai Lama and Howard C. Culter",
        "description":
            "In this unique and important book, one of the world's great spiritual leaders offers his practical wisdom and advice on how we can overcome everyday human problems and achieve lasting happiness.The Art of Happiness is a highly accessible guide for a western audience, combining the Dalai Lama's eastern spiritual tradition with Dr Howard C. Cutler's western perspective. Covering all key areas of human experience, they apply the principles of Tibetan Buddhism to everyday problems and reveal how one can find balance and complete spiritual and mental freedom.For the many who wish to understand more about the Dalai Lama's approach to living, there has never been a book which brings his beliefs so vividly into the real world.",
        "coverImage":
            "https://upload.wikimedia.org/wikipedia/en/thumb/e/ee/The_Art_of_Happiness.jpg/240px-The_Art_of_Happiness.jpg",
        "bookLink":
            "https://drive.google.com/file/d/1A69dZrIPl_iL08FL0G2f4uQ1ABcQkkKs/view?usp=sharing"
      },
      {
        "book name": "Authentic happiness",
        "author": "Martin E.P Seligman",
        "description":
            "According to esteemed psychologist and bestselling author Martin Seligman, happiness is not the result of good genes or luck. Real, lasting happiness comes from focusing on one's personal strengths rather than weaknesses—and working with them to improve all aspects of one's life.",
        "coverImage": "https://m.media-amazon.com/images/I/51EF50VEAHL.jpg",
        "bookLink":
            "https://drive.google.com/file/d/1U3AcBsfVTY9rYX9vUw4CYYXqY1IJeJZz/view?usp=sharing"
      },
      {
        "book name": "Power of Positive Thinking",
        "author": "Norman Vincent Peale",
        "description":
            "THE POWER OF POSITIVE THINKING is a practical, direct-action application of spiritual techniques to overcome defeat and win confidence, success and joy. His gentle guidance helps to eliminate defeatist attitudes, to know the power you possess and to make the best of your life.",
        "coverImage": "https://m.media-amazon.com/images/I/81ND4ZcIsxL.jpg",
        "bookLink":
            "https://drive.google.com/file/d/1PO-OJ-eB1cAVgm_5KaaeLodSh4wT7IdI/view?usp=sharing"
      }
    ],
    "stress": [
      {
        "book name": "Stress Proof",
        "author": "Mithu Storoni",
        "description":
            "We all experience short bursts of stress in our lives--it's an inevitable aspect of life in the 21st century. But research is uncovering the delicate balance in the brain that determines whether a short stressful episode turns into a systemic overload, leading to inflammation, anxiety, depression and other chronic health issues.This practical and groundbreaking guide reveals what's going on in our brains and bodies when stress gets out of control",
        "coverImage": "https://m.media-amazon.com/images/I/81Z8eq14uRL.jpg",
        "bookLink":
            "https://drive.google.com/file/d/1Ox9psY7679p41kzwtQeVYebuKPGK4K6j/view?usp=sharing"
      },
      {
        "book name": "The Upside of Stress",
        "author": "Kelly McGonigal",
        "description":
            "Drawing from groundbreaking research, psychologist and award-winning teacher Kelly McGonigal, PhD, offers a surprising new view of stress—one that reveals the upside of stress, and shows us exactly how to capitalize on its benefits.You hear it all the time: stress causes heart disease; stress causes insomnia; stress is bad for you! But what if changing how you think about stress could make you happier, healthier, and better able to reach your goals?",
        "coverImage":
            "https://m.media-amazon.com/images/I/51I8Mv-wzlL._SX326_BO1,204,203,200_.jpg",
        "bookLink":
            "https://drive.google.com/file/d/1fmSsxi5hIVnLPFEafrIBZ3kFK19oWsDx/view?usp=sharing"
      },
      {
        "book name": "cognitive behavioral Therapy",
        "author": "Katherine Chambers",
        "description":
            "Almost all of us will suffer from issues relating to negative thinking patterns at some stage in life. It's unavoidable. Whether it's facing phobias, obsessive-compulsive tendencies or full-scale anxiety or depression. It's much more prevalent than you think. But most people aren't equipped with the right mental tools to identify the underlying reasons for their problems or spot the triggers which set them off.This is where Cognitive Behavioral Therapy can help. Since it's discovery in the 1960's, CBT has proved to be one of, if not the most beneficial & effective modes of therapy for treating all human mental disturbances.",
        "coverImage":
            "https://m.media-amazon.com/images/I/41p7yHtKVpL._SR600%2C315_PIWhiteStrip%2CBottomLeft%2C0%2C35_PIStarRatingFOUR%2CBottomLeft%2C360%2C-6_SR600%2C315_ZA13%2C445%2C290%2C400%2C400%2CAmazonEmberBold%2C12%2C4%2C0%2C0%2C5_SCLZZZZZZZ_FMpng_BG255%2C255%2C255.jpg",
        "bookLink":
            "https://drive.google.com/file/d/1lTDx5RHEiFIEucxLibv1Uxo6ORIjp9b5/view?usp=sharing"
      },
      {
        "book name": "Well Stressed",
        "author": "Sonia Lupien",
        "description":
            "Manage Stress Before It Turns Toxic Based on scientific research that will help you Understand stress and make it your ally Recognize the four factors that make a situation stressful Identify your stressors and reduce their impact Discover methods to cope with stress and restore your equilibrium",
        "coverImage":
            "https://images.mind-books.nl/libris/book/cover/9781443430272?hash=52ed51c&width=200",
        "bookLink":
            "https://drive.google.com/file/d/1YxLiJg7IC7X3X_g66H1yWgxNDbE-r0pw/view?usp=sharing"
      }
    ]
  };

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              const Text(
                "WellBook",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 40,
                    fontWeight: FontWeight.w600),
              ),
              const Text(
                "We'll suggest you books according to you emotion",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.red)),
                child: TextFormField(
                  controller: text,
                  onChanged: (v) {
                    if (v == "fear" ||
                        v == "sad" ||
                        v == "happy" ||
                        v == "stress") {
                      t = v;
                      print("hi");
                      loading = true;
                      setState(() {});
                    }
                  },
                  decoration: InputDecoration(
                      hintText: "Your Emotion",
                      fillColor: Colors.white,
                      focusColor: Colors.red,
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              !loading
                  ? Padding(
                      padding: const EdgeInsets.only(top: 200),
                      child: Center(child: Text("Search Your Emotion")),
                    )
                  : Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: data[t]!.length,
                          itemBuilder: (context, index) {
                            List v = data[t]!;
                            return GestureDetector(
                              onTap: () async {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PDFViewerFromUrl(
                                            url: v[index]["bookLink"])));
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 15),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        width: width / 3.5,
                                        height: 150,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: CachedNetworkImage(
                                            imageUrl: v[index]["coverImage"],
                                            placeholder: (context, url) =>
                                                CircularProgressIndicator(),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 7,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                v[index]["book name"],
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                v[index]["author"],
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                v[index]["description"],
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    )
            ],
          ),
        ));
  }
}
