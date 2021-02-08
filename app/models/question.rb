class Question
  attr_reader :id

  def initialize(id)
    @id = id
    @question = ::Question.questions[id.to_i]
  end

  def text
    @text ||= @question[0]
  end

  def answers
    @answers ||= @question[1].map(&:first)
  end

  def score(answer_id)
    @question[1][answer_id.to_i][1]
  end

  class << self
    def questions
      @questions ||= [
        [
          'You’re really busy at work and a colleague is telling you their life story and personal woes. You:',
          [
            ['Don’t dare to interrupt them', 1],
            ['Think it’s more important to give them some of your time; work can wait', 2],
            ['Listen, but with only with half an ear', 3],
            ['Interrupt and explain that you are really busy at the moment', 4]
          ]
        ],
        [
          'You’ve been sitting in the doctor’s waiting room for more than 25 minutes. You:',
          [
            ['Look at your watch every two minutes', 1],
            ['Bubble with inner anger, but keep quiet', 2],
            ['Explain to other equally impatient people in the room that the doctor is always running late', 3],
            ['Complain in a loud voice, while tapping your foot impatiently', 4]
          ]
        ],
        [
          'You’re having an animated discussion with a colleague regarding a project that you’re in charge of. You:',
          [
            ['Don’t dare contradict them', 1],
            ['Think that they are obviously right', 2],
            ['Defend your own point of view, tooth and nail', 3],
            ['Continuously interrupt your colleague', 4]
          ]
        ],
        [
          'You are taking part in a guided tour of a museum. You:',
          [
            ['Are a bit too far towards the back so don’t really hear what the guide is saying', 1],
            ['Follow the group without question', 2],
            ['Make sure that everyone is able to hear properly', 3],
            ['Are right up the front, adding your own comments in a loud voice', 4]
          ]
        ],
        [
          'During dinner parties at your home, you have a hard time with people who:',
          [
            ['Ask you to tell a story in front of everyone else', 1],
            ['Talk privately between themselves', 2],
            ['Hang around you all evening', 3],
            ['Always drag the conversation back to themselves', 4]
          ]
        ],
        [
          'You crack a joke at work, but nobody seems to have noticed. You:',
          [
            ['Think it’s for the best — it was a lame joke anyway', 1],
            ['Wait to share it with your friends after work', 2],
            ['Try again a bit later with one of your colleagues', 3],
            ['Keep telling it until they pay attention', 4]
          ]
        ],
        [
          'This morning, your agenda seems to be free. You:',
          [
            ['Know that somebody will find a reason to come and bother you', 1],
            ['Heave a sigh of relief and look forward to a day without stress', 2],
            ['Question your colleagues about a project that’s been worrying you', 3],
            ['Pick up the phone and start filling up your agenda with meetings', 4]
          ]
        ],
        [
          'During dinner, the discussion moves to a subject about which you know nothing at all. You:',
          [
            ['Don’t dare show that you don’t know anything about the subject', 1],
            ['Barely follow the discussion', 2],
            ['Ask lots of questions to learn more about it', 3],
            ['Change the subject of discussion', 4]
          ]
        ]
      ]
    end
  end
end