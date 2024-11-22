local assets = {Asset("ANIM", "anim/story_book.zip"), Asset("ATLAS", "images/inventoryimages/story_book.xml"),
                Asset("IMAGE", "images/inventoryimages/story_book.tex")}

local prefabs = {}

-- 不同物品对应的故事表

local story_table_cn = {

    default = { -- 默认故事
    "默认讲述雪莉的故事，将专属道具放到物品栏第一格可以开始讲述这个道具的故事，两个书包用蓝色羽毛和熊皮替换",
    "现在开始讲述雪莉的故事",
    "很久以前,在一个充满魔法的王国里,住着一位美丽却又孤独的公主,名叫雪莉。",
    "她拥有强大的魔法能力,但因为父母的过度保护,雪莉被困在华丽却冰冷的宫殿中,无法自由地探索和使用她的魔法。",
    "尽管有仆人和侍卫围绕,但雪莉总觉得自己像一只被关在金笼里的鸟儿,无法展翅飞翔。",
    "雪莉的爱好是阅读,总是沉浸在宫廷图书馆的书籍中。",
    "一天,她无意中发现了一本古老的魔法书,书中提到一副装饰有雪莲花的神秘眼镜。",
    "传说佩戴上它可以改变一个人的样貌,但同时会使她的所有魔法失效。",
    "雪莉意识到,这副眼镜或许是她逃离宫廷的唯一机会。",
    "经过几天的寻找,雪莉终于在宫廷的一个隐蔽角落找到了那副存放在展柜上的神秘眼镜。",
    "先是环顾四周,在确定没有人的情况下偷偷的把眼镜拿了下来。",
    "她戴上眼镜,顿时感到自己容貌发生了变化,变得平凡无奇,同样的她的魔法也瞬间消失了。",
    "就在这时,碰巧路过的守卫发现了雪莉。",
    "因为雪莉佩戴眼镜的原因,守卫没能认出这是公主雪莉。",
    "便大声怒吼道:“你是什么人？为什么出现在这里！”",
    "雪莉很快反应过来,因为自己的样貌已经发生了变化。",
    "看到存放展柜下方的一把已经坏掉的剑,她没有犹豫,把剑拿起后放在了自己的衣服里。",
    "随后她急忙低头掩饰自己的面容,语无伦次地回答:“我……我是这里的新仆人,迷路了。”",
    "守卫皱起眉头,显得有些不耐烦,但并没有多想。",
    "他挥了挥手,示意她赶快离开:“这里不是你该来的地方,快走吧！”",
    "雪莉感到心脏狂跳,但她努力保持镇定,尽管这样她已经握紧了剑柄。",
    "离开守卫的视线后,她迅速向宫廷的后门移动。",
    "她知道,后门的守卫通常较少,是她逃离的最佳途径。",
    "经过一番小心翼翼的躲避,雪莉终于来到了后门。",
    "她观察了一下,发现只有一个守卫在打瞌睡。",
    "雪莉屏住呼吸,轻轻地推开门,悄无声息地溜了出去。",
    "一踏出宫殿的大门,雪莉便感到一阵轻松,但她知道,现在不是放松的时候。",
    "她必须尽快远离这个地方,找到一个安全的藏身之处。",
    "在夜幕的掩护下,她一路小跑,天亮后最终来到了一片开满鲜花的草地上。",
    "这里,有一群年轻人正在愉快地弹奏乐器和歌唱。",
    "雪莉藏在一棵大树后,默默地听着,心中升起一股强烈的渴望,渴望像他们一样自由。",
    "就在这时,一个年轻人发现了她的存在。",
    "他叫海伦·汉,是个热心肠的家伙,善于察觉他人的情绪。",
    "他走近雪莉,温柔地问:“你为什么躲在这里？”",
    "雪莉很是谨慎,犹豫了一下,但她从海伦·汉的眼中看到了真诚。",
    "便编造了谎言:“自己只是一个普通人,因家庭缘故已经无家可归”。",
    "海伦·汉听后,非常同情雪莉,决定帮助她在新的世界中找到属于自己的生活。",
    "海伦·汉看到雪莉带着眼镜猜测她热爱知识,便询问到:“你一定很渴望知识对吧？”",
    "面对这样的询问雪莉也只是点点头。", "海伦·汉了解后便带她去了一所魔法学府。",
    "这个学府接受任何热爱魔法和知识的人。",
    "入学手续相对简单,海伦·汉为雪莉准备了所有必要的文件。",
    "所有的入学流程下来,也是成功的通过。",
    "拿到了必要的学生卡和一些书籍,正式开始了学习生活。",
    "期间由于雪莉戴着眼镜,她的魔法能力还被封印了,再加上她的外表看起来平凡无奇。",
    "所有人都以为她是一个没有魔法天赋的新生。",
    "在魔法学府的生活中,雪莉偶然发现了一本被压在桌角下的书籍。",
    "它的封面散发着神秘的光芒,吸引着她的目光。",
    "书页上记载着一种被称为“永恒领域”的神秘魔法。",
    "雪莉被书中的描述深深吸引,渴望探索更广阔的世界。",
    "于是她便好奇般的翻开书页,开始阅读其中的内容。",
    " 随着她的眼睛掠过文字,一股神秘的力量在书页上涌动,似乎在召唤着她。",
    "突然间,一道耀眼的白光从书页中喷涌而出,将雪莉整个人笼罩其中。",
    "她感觉自己的身体不受控制地被卷入白光之中,意识逐渐模糊…… ",
    "当雪莉再次睁开眼睛时,她发现自己置身于一个奇幻而神秘的世界——永恒领域。",
    "雪莉的故事到这里应该就结束了。", "如果你想知道后面会发生什么？",
    "这问题你得问雪莉哦,她会告诉你的ಠᴗಠ"},

    broken_sword = { -- 断剑的故事
    "在存放展柜的阴影下,一把古老而庄严的剑静静地躺在那里。",
    "剑身已经失去了昔日的光泽,但依然散发着一种岁月沉淀下来的独特韵味。",
    "正因如此才并不普通,它是历代公主的佩剑",
    "只是一次在保护公主的期间,因为使用年限将至,最终出现了裂痕并断裂。",
    "虽然历经风霜,但依旧让人心生敬畏。",
    "尽管这时的雪莉变成了普通人但身份依然是公主。",
    "雪莉并不清楚这把尘封已久的断剑只有公主才有资格佩戴。",
    "守卫注意到雪莉的异常举动,皱起了眉头。",
    "他走上前来,质问雪莉,确保没有问题后只好让她尽快离开。",
    "随后守卫走进存放展柜的房间,想要查看是否有异常情况。",
    "他的目光很快就被展柜下方的空无一物的剑鞘所吸引。",
    "他瞪大了眼睛,意识到刚才那个自称是新仆人的女孩,实际上就是偷走了公主佩剑的人。",
    "他立刻追了出去,但雪莉已经消失得无影无踪。",
    "在逃出宫廷后,雪莉依然带着这把断剑。",
    "在逃离的过程中,雪莉紧握着那把看似破败不堪的断剑。",
    "然而在她的手中,这把剑却仿佛重新焕发了生机。",
    "剑身虽然残破,但在雪莉的手中却显得异常锋利。",
    "她不知道为何这把剑会在她手中变得如此不同。", "仿佛与她产生了某种奇妙的共鸣。",
    "后面再海伦·汉的帮助下成功入学,确保学校安全后。",
    "将那把并不普通的断剑存放了起来,她深知这把剑的非凡之处。",
    "在不需要它的时候,将其妥善保管,以免引发不必要的麻烦。",
    "在被魔法书传送到永恒领域后。", "在意识清醒时,她惊讶地发现。",
    "那把被她存放在学校的断剑,竟然同她一起出现在了这里。",
    "迫不得已雪莉只好在这里想办法生存下去。",
    "雪莉发现这把断剑不仅可以在危险时保护自己,还可以当做工具使用。",
    "在永恒领域中,雪莉和这把断剑共同经历了许多冒险和挑战。",
    "后面雪莉到底会又会经历什么?没人会知道。",
    "但这把断剑依然会坚持自己的使命,在雪莉需要的时候保护她。", "断剑的故事结束"},

    winter_sword = { -- 冬之刃的故事
    "曾经一直流传着一柄名为“冬之刃”的神奇宝剑的传说。",
    "这柄剑是历代公主的佩剑,它见证了一个又一个公主。",
    "冬之刃的剑身闪耀着寒霜般的光芒,剑尖锐利,仿佛能劈开最坚固的冰雪。",
    "然而,随着时间的流逝,冬之刃也历经了无数的战斗和磨损。",
    "最终在一次保护公主的激战中,因承受了巨大的冲击而断裂。",
    "最后不知过了多少年冬之刃也被渐渐遗忘。", "一直存放在王国深处的一个展柜中。",
    "谁又会知道公主雪莉偶然间发现了它。",
    "她并不知道这把断剑的历史,也不曾有人与她提及。",
    "在永恒领域里,一直同雪莉一起。", "这里有着四季的变化。", "时间很快来到了冬天。",
    "一天夜里,如往常雪莉正准备休息时,剑柄散发着蓝光。",
    "诉说着需要什么,雪莉貌似读懂了意思。",
    "雪莉握紧断剑,心中虽然有许多疑问,她闭上眼睛。", "这时剑身开始愈合,裂痕消失。",
    "变得如同新生的一样光滑明亮。", "拿着感觉十分轻盈。",
    "冬之刃,就这样在雪莉的手中再获新生。",
    "重生后的冬之刃不仅恢复了昔日的光辉,还拥有了更为强大的力量。",
    "不同于之前的断剑,在面对更强大的怪物时。",
    "冬之刃拥有无与伦比的力量,很轻松的将敌人击败。",
    "随着时间的推移,雪莉逐渐掌握了冬之刃的力量。",
    "在永恒领域中,她与冬之刃共同经历了许多冒险和挑战。",
    "她明白,这把剑不仅是她的武器,更是她的守护者。",
    "也应证了传说,是历代公主的佩剑。",
    "哪怕冬之刃在使用时坏掉,也只会变成断剑,而不是消失。",
    "只要雪莉愿意,都能在每次坏掉后修复。"},
    blood_sword = { -- 血之刃的故事
    "在传说中，除了那把象征纯洁与重生的冬之刃，还有一柄名为“血之刃”的神秘宝剑。",
    "血之刃是与冬之刃同时代的产物，但它的力量源自黑暗与鲜血。",
    "这柄剑的剑身泛着暗红色的光芒，剑刃异常锋利，似乎能吸收每一个倒在它面前的敌人的灵魂。",
    "相传，血之刃最初是由一位被诅咒的王子所持有，他为了保护自己的王国，不惜付出生命与灵魂的代价。",
    "血之刃在无数次战斗中，变得越来越强大，但也逐渐被人们所惧怕。",
    "最终，这位王子在一次决战中牺牲，而血之刃则被封印在一座古老的神殿深处。",
    "随着时间的推移，血之刃的故事逐渐被遗忘，只有少数古籍中还记录着它的传说。",
    "一天，公主雪莉在探险中偶然进入了那座被遗忘的神殿，发现了血之刃。",
    "当她靠近这柄剑时，血之刃竟然发出了低沉的嗡鸣声，仿佛在呼唤她。",
    "尽管有些害怕，但雪莉感受到一种无法抗拒的力量，她握住了血之刃的剑柄。",
    "瞬间，她的眼前闪过无数过去的战斗画面和那位王子的牺牲。",
    "血之刃吸收了雪莉的鲜血，剑身上的裂痕开始愈合，变得更加闪耀。",
    "虽然血之刃带给雪莉无与伦比的力量，但她也感受到剑中的黑暗力量在试图侵蚀她的心灵。",
    "尽管如此，她只能尽力减少血之刃对她的侵蚀，但仍然无法完全消除其影响。",
    "她明白，血之刃不仅是作为一把武器，更是一种责任与考验。",
    "血之刃和冬之刃，象征着王国的光明与黑暗，只有平衡这两者，才能守护自己和他人。",
    "雪莉不仅掌控了冬之刃的寒霜之力，也尽力驯服了血之刃的黑暗力量。"},
    paper = { -- 试卷的故事的故事
    "在魔法学府的日子里,雪莉虽然对魔法充满热情。",
    "但她的心思总是飘忽不定,像一朵随风摇曳的蒲公英。",
    "开小差几乎成了她的日常习惯,每次老师讲课,雪莉的思绪却早已飘到了九霄云外。",
    "终于,在一次重要的考试中,雪莉的“开小差”习惯给她带来了不小的麻烦。",
    "试卷上的题目对她来说就像一座座难以逾越的高山。", "她冥思苦想,却仍是一筹莫展。",
    "就在这时,她瞥见了旁边同学试卷。", "雪莉心中一动,决定铤而走险,偷偷抄袭一下。",
    "她小心翼翼地挪动视线,生怕被监考老师发现。",
    "然而,由于太过紧张,她的手一抖,竟然把那位同学的名字也一并抄了下来！",
    "当试卷被收上去时,突然晃见上面没有我的名字,雪莉的心已经悬在嗓子眼。",
    "后面的日子她祈祷着老师不要发现这个“小秘密”。",
    "可是,命运似乎总爱和她开玩笑。",
    "没过多久,试卷就被发了下来,雪莉的试卷上赫然写着一个大大的“0”分,",
    "旁边还批注着:“抄作业也得动动脑袋,下次就惩罚打扫卫生了”",
    "雪莉看着这个刺眼的“0”分,心中自然不好受。",
    "她意识到自己不能再这样下去了,必须改掉开小差的坏习惯。",
    "于是,她下定决心,努力提高自己的学习水平。",
    "当然,雪莉也没有忘记那个给她带来“0”分教训的同学。",
    "她主动找到那位同学,诚恳地向她道歉,并感谢她让自己意识到了自己的错误。",
    "从那以后,雪莉像变了个人似的,她上课认真听讲,课后勤奋练习。",
    "每当她想要开小差时,就会想起那个“0”分的教训,提醒自己要专心学习。",
    "至此0分的故事结束。"},
    snow_finch_fan = { -- 雪雀扇的故事
    "同往常一样，雪莉在学院的图书馆想要寻找书本阅读。",
    "却无意中发现了一本尘封已久的古老书籍。",
    "这本书籍似乎很少有人翻阅，上面布满了厚厚的灰尘。",
    "她好奇地翻开书，发现书中记载了一种名为“雪雀扇”的强大魔法物品。",
    "据书中描述，雪雀扇不仅能召唤出强大的飓风，还能操控四周的温度。",
    "雪莉被深深吸引住了，她决定按照书中的指示尝试制作这个雪雀扇。",
    "书中提到，制作雪雀扇需要一种非常稀有的材料——雪雀羽毛。",
    "这种羽毛只能在极北之地的一种传说中的雪雀身上找到。",
    "经过一番思索，雪莉决定踏上寻找冰晶羽毛的冒险旅程。",
    "雪莉做好了充分的准备，带上了她最信任的断剑和一些必要的生活用品，朝着极北之地出发了。",
    "在漫长的旅途中，雪莉经历了种种艰险：她穿越了无尽的冰川，",
    "躲避了凶猛的冰兽，还在极寒的天气中与饥饿和孤独作斗争。",
    "然而，她始终没有放弃。",
    "终于，在一个月光皎洁的夜晚，她在一片静谧的雪原上看到了传说中的雪雀。",
    "雪雀羽翼洁白，犹如天使降临。", "它的眼神纯净无暇，似乎能看透一切。",
    "雪莉屏住呼吸，小心翼翼地靠近雪雀。",
    "她用心地向雪雀说明来意，并展示了自己的真诚和勇气。",
    "雪雀似乎感受到了雪莉的决心，轻轻拍打着翅膀，掉落了一根闪耀着冰蓝光芒的羽毛。",
    "雪莉捧着冰晶羽毛，心情十分激动。", "她终于找到了制作雪雀扇的最后一块拼图。",
    "回到学院后，雪莉按照古书中的步骤，小心翼翼地将冰晶羽毛嵌入一把精致的扇子中。",
    "随着最后一道魔法咒语的完成，雪雀扇散发出耀眼的光芒。",
    "雪雀扇的四周的气流貌似都在随着魔力在涌动。",
    "召唤出强大的飓风，任何魔物都将无法靠近。",
    "我想没人会想要轻易惹怒雪雀扇的拥有者"},
    paper_plane = { -- 纸飞机的故事
    "阳光洒在雪莉的脸上,她的手中紧握着一张刚刚发下来的0分试卷。",
    "雪莉的心中充满了沮丧和尴尬,她从未想过自己会落得这样的下场。",
    "就在几天前,雪莉因为考试压力过大,选择了作弊。",
    "她小心翼翼地抄袭了旁边同学的试卷,然而由于紧张和经验不足。",
    "她不小心连同学的名字也一起抄了下来。",
    "结果可想而知,雪莉得到了一个刺眼的0分,并在全班面前成为了笑柄。",
    "雪莉坐在教室里,看着那张0分试卷,心中五味杂陈。",
    "她感到羞愧和懊悔,同时也对自己的粗心大意感到愤怒。",
    "就在这时,她突然有了一个想法——用这张试卷折一只纸飞机。",
    "雪莉小心翼翼地将试卷展开,然后按照记忆中的步骤开始折纸",
    "她的手指在试卷上灵活地翻飞,很快,一只精致的纸飞机就完成了。",
    "纸飞机在阳光下显得熠熠生辉,仿佛在嘲笑她的失败。",
    "然而,雪莉并没有因此而气馁。", "她看着手中的纸飞机,心中涌起一股莫名的力量。",
    "她意识到,这张0分试卷虽然给她带来了挫折和尴尬,但也给了她一个重新开始的机会。",
    "随后将纸飞机用力地将其投向天空。",
    "看着纸飞机在蓝天中自由翱翔,雪莉仿佛也感受到了自己的心灵在飞翔。",
    "随着时间的推移,雪莉的魔法水平逐渐提高,她的成绩也开始稳步上升。",
    "她不再需要作弊来取得好成绩,而是凭借自己的努力和实力赢得了同学们的尊重和敬佩。",
    "而那只由0分试卷折成的纸飞机。", "也成为了雪莉学习道路上的重要见证。",
    "折纸飞机便成了雪莉的一个习惯,每当感到压力很大时。",
    "都会折一个纸飞机,然后用力将它投掷出去。", "纸飞机的故事结束"},
    story_book = { -- 故事书的故事
    "你想知道故事书的故事？", "怎么会有这种故事？(°Д°)", "我觉得还是不写了。",
    "主要是我也懒罒ω罒", "况且那些故事我也觉得不怎么样。", "", "", "", "", "",
    "你还在翻？", "", "真的没有写。(˘•ω•˘)", "", "", "", "", "", "好吧你赢了。￣ω￣",
    "如果你听完了雪莉或者其他道具的故事", "那不妨来听听我的故事吧。",
    "当然如果你有兴趣的话", "内容可能会很长很长,如果你觉得可以的话就请往下翻吧！",
    "高一那会儿,因为学习允许带手机。", "所以玩游戏的时间也就多了些。",
    "偶然间看到室友在手机上玩饥荒", "因为没有电脑嘛,所以用的手机。",
    "玩的是别人的整合包（就是巨人国和海难的版本）", "在整合包里面也内置了的很多mod",
    "就包括雪莉的人物mod在里面。", "雪莉的话也是我第一个接触的人物mod。",
    "一下就喜欢上了。", "我这个人呢也更偏向于玩原版", "像我玩Minecraft的时候也是这样。",
    "其实我也尝试过很多的人物mod", "但是对我来说雪莉这个mod感觉就是最好的。",
    "一方面原作者Monoko画的真的很好看！！！",
    "还有就是人物的声音,虽然不知道是怎么配的吗,但也觉得很棒。",
    "基本我只要游玩就一定会选择这个雪莉人物mod", "后面呢因为某些原因嘛,还是弃坑了。",
    "记得最后一次玩实在高二暑假,我还记得很清楚", "时间总是过得很快,转眼就大二下了",
    "因为大学了嘛,有电脑,也换到了新的寝室。", "好巧不巧新室友就都喜欢玩联机版",
    "其实很早就想玩联机版,只是找不到人一起玩而已。",
    "但是呢又没有玩多久他们又不玩了。",
    "而且啊,这个联机版有延迟,每次捡东西做什么都有", "总之啊,就是不太喜欢玩联机版。",
    "话虽这么说,但是那个每日的登录礼物还是不错的。",
    "我能玩到单机版的全部DLC还是靠卖联机版道具皮肤买的(〃'▽'〃)",
    "后面啊也就是我一个人玩单机版了。", "不过呢越玩越感觉少了什么。",
    "还记得我最开始说的吗？  是的！正是雪莉mod, ",
    "但是呢,在创意工坊呢又没有找到和雪莉有关的人物mod",
    "最后在网上才找到了雪莉mod的6.1版本", "这貌似是Monoko的最后更新版本",
    "版本的更新是2017年1月4日", "看样子快停更了8年",
    "联机版其实也有人去做雪莉mod,不过呢那是联机版。",
    "其实呢这并不是我想重做雪莉的原因。", "真正的原因是一次我在玩海难DLC的时候。",
    "这个人物在船上如果有旗帜的话人物应该会有一个叉腰然后闭眼的动作。",
    "但是呢,这个很正常的动作因为雪莉mod版本落后的原因。",
    "雪莉脸上并没有表情,变成了空的。", "同样的贴图bug在哈姆雷特也会有。",
    "你看啊,一个自己那么喜欢的mod有问题,而且还没有人去修复。",
    "这我哪里能忍啊,肯定就是不惯着。", "最后呢也是找到了原因",
    "因为旧版mod人物表情只提供了16份,而新版的支持到了33份表情。",
    "这样一来,贴图bug就修复了",
    "这种感觉就很爽对吧,就像一道数学题卡了你很久一下但最后还是做出来那种感觉。",
    "我想大家应该也有过类似的体验。", "后来呢,也就上头了,既然贴图bug也都修复了。",
    "怎么不再来个重做呢？", "再然后就是自学lua,借来数位板。",
    "先是弄个人物个性化话稿,就是检查东西说的话。", "参考的是威尔逊的英文话稿",
    "因为英语水平又不好,只好用用翻译一句一句来", "很长,自然也很枯燥。",
    "然后就是实际的游玩,将翻译错误的话语进行修正。", "接下来就是说人物的绘画",
    "倒腾一个多月还是将雪莉进行了重绘。",
    "其实最后我还保留了表情,因为这使得看起来还像原来的雪莉。",
    "贡献榜的另一位就是借给我数位板的朋友",
    "如果没有数位板光用鼠标画这对我来说几乎不可能。",
    "最后就是代码部分了,自然也是让我很头疼的部分了。",
    "学到了lua一部分可以用到里面来,但是API的调用啊,一些判断逻辑啊之类的。",
    "可能对于那些大佬来说就是小水花,但对我初学者简直巨浪一般。",
    "你问要是要不会的怎么办？那只有去网上找教程呗。",
    "这个一找不要紧,能找到的全是联机版的教程。",
    "这时我才反应过来,原来玩单机版的人是越来越少了。",
    "没办法找不到教程就只好自己回来研究代码了。",
    "好几次写代码因为想实现某个功能一弄就是一个下午。", "就比如断剑那个随机伤害。",
    "本想的是让每次攻击目标都是伤害随机的。",
    "结果实在想不到怎么弄,最后的只好在每次装备时伤害是随机的。",
    "总之啊,这个写代码的过程还是挺艰难的。", "还在最后还是成功的将mod完成了。",
    "我想做这些全凭的喜欢吧。", "最后感谢你能订阅本mod。",
    "感谢你愿意听完这个无聊的故事。", "“往事不可追,来日犹可期！”"},

    glasses = { -- 眼镜的故事
    "故事中的神秘雪莲花眼镜", "从前流传着一个关于神秘雪莲花眼镜的传说。",
    "这副眼镜并非普通的饰品,而是蕴含着强大魔力的神秘之物。",
    "据传说,这副眼镜最初是由一位古老而强大的魔法师所铸造。",
    "魔法师在一次意外中发现了神秘的雪莲花,这朵雪莲花蕴含着强大的力量。",
    "魔法师利用这朵雪莲花和多年的魔法知识,打造出了这副眼镜。",
    "当有人戴上这副眼镜时,眼镜的魔力便会悄然释放。",
    "眼镜材料轻盈,虽然会让佩戴者变得聪明。",
    "但第一次佩戴就会剥夺佩戴者的魔法力量,让她瞬间失去所有的魔法能力。",
    "紧接着,眼镜会改变佩戴者的外貌,让他们变得普通而平凡,难以被认出。",
    "这副眼镜的魔力如此强大,以至于没有人敢轻易尝试戴上它。",
    "它被视为一个禁忌的存在,被存放在宫廷的角落里,只有很少数人知道它的存在。",
    "雪莉在书籍中阅读发现了眼镜的存在,她很清楚这是她逃离宫廷的机会。",
    "经过多番寻找,也是成功的找到了眼镜。",
    "从展柜拿下眼镜,雪莉并没有犹豫然后戴了上去。",
    "就在雪莉戴上眼镜的那一刻,她感到一股强大的力量从眼镜中涌出,瞬间将她笼罩。",
    "她的意识开始变得模糊,魔法力量也在迅速流失。", "眼镜的魔法并没有持续很久。",
    "当她再次睁开眼睛时,她惊讶地发现自己已经不再是原来的模样。",
    "她的外貌变得普通,身上的魔法力量也消失得无影无踪。",
    "这并没有让她感到恐惧,她知道这是她的机会。", "躲过守卫逃出宫廷,看似很轻松。",
    "实则全是眼镜的功劳,因为眼镜一直在暗中帮助雪莉。",
    "经过一些奇妙的经历,雪莉居然成功入学了。",
    "尽管戴上眼镜能让人变得聪明但不会让人变得勤快。",
    "雪莉在校的成绩并不理想,这也让她很是头疼。",
    "不过一次偶然的作弊既然使得雪莉改掉了一些坏习惯。",
    "这些意外看起来好像都是偶然,但没人会知道的是。", 
    "一直都是雪莲花眼镜的魔法。",
    "不过呢这一切都是雪莉自己决定的。"},

    ribbon_hat = { -- 缎带帽的故事
    "雪莉是一个名不见经传的普通学生。",
    "她不如那些天赋异禀的同学光彩照人，也没有夺目的魔法天赋。",
    "每次魔法课，她都尽力跟上教授的讲解，拼命记住那些复杂的咒语，但她的施法总是差强人意。",
    "一天，雪莉在学院的图书馆里整理旧书籍，角落里一个布满灰尘的小盒子吸引了她的目光。",
    "出于好奇，她打开了盒子，发现里面是一顶古老的缎带帽。",
    "这顶帽子看起来平平无奇，但却散发着一股微弱的魔力波动。",
    "“也许只是某个学生的旧帽子吧。”雪莉轻声自语，但她还是忍不住戴上了它。",
    "瞬间，雪莉感觉到了一股温暖的力量涌入身体，仿佛某种沉睡已久的力量被唤醒。",
    "她举起手，念出了一个她一直以来都无法顺利施展的冰晶咒语。",
    "令她惊讶的是，冰晶瞬间在她的掌心成形，比她以往施展的任何魔法都更加明亮、稳定。",
    "雪莉的心跳加速了。",
    "她开始尝试更多的咒语，每一个咒语都比以前施展得更为顺畅和强大。",
    "这顶缎带帽仿佛在引导她，将她的魔力引向更高的境界。",
    "从那天起，雪莉的表现大幅提升。",
    "她不仅能够熟练掌握那些复杂的咒语，还能在实际的魔法对决中轻松击败那些曾经令她望而却步的对手。",
    "她的小故事开始在学院中流传，教授们也开始注意到这个原本不起眼的学生。",
    "然而，雪莉并没有因此而骄傲。",
    "她知道，这顶缎带帽虽然赋予了她力量，但也带来了责任。",
    "她开始研究这顶帽子的来历，并发现它曾属于一位伟大的魔法师，据说这位魔法师用尽一生的魔力将帽子附魔，以期望找到一个真正有潜力的继承人。",
    "随着雪莉的魔力不断增强，她也逐渐领悟到，真正的力量并非来自帽子，而是来自她自己内心的坚韧和信念。",
    "最终，她学会了在不依赖缎带帽的情况下施展强大的魔法。",
    "一天，雪莉将缎带帽小心地放回原来的盒子里，将它重新放在图书馆的角落。",
    "她明白，这顶帽子将会等待下一个值得拥有它的人，而她自己，将凭借自己的力量，成为一名伟大的魔法师。"},

    ice_crown = { -- 冰冠的故事
    "有一个古老的传说,讲述着一顶神秘的冰霜王冠。",
    "这顶王冠并非普通的王冠,而是象征着王国公主的尊严与力量的象征。",
    "故事开始于一个冬日的清晨。",
    "在王国的皇宫里,传来了一个喜讯:雪莉将在今日接受冰霜王冠的传承。",
    "但是,与以往不同的是,雪莉并不渴望成为公主,她只想过着简单平凡的生活。",
    "雪莉是一位美丽却又孤独的女孩,但她却热爱外面的生活。",
    "然而,王国的传统却注定了她的命运。",
    "在一座古老的神殿里,冰霜王冠被安置在一块冰冷的石台上。",
    "这顶王冠由纯净的水晶和寒冷的冰雪凝结而成,散发着令人惊叹的光芒。",
    "王国的长老们在神殿内集合,开始了传承仪式。",
    "传承仪式的是一项试炼,是对公主的勇气、智慧和品德的考验。",
    "雪莉被带到了一片古老的森林,她的任务是寻找那颗失落的水晶。",
    "这个水晶并非普通的宝石,而是王国的灵魂之源,只有公主才能找到它。",
    "在茂密的树林中,雪莉面对着无尽的困难和挑战,但她从未放弃。",
    "她用自己的勇气和智慧,渐渐地接近了目标。",
    "最终,在一棵古老的巨树下,她找到了那颗闪烁着微光的水晶。",
    "它如同王国的心脏般散发着温暖的光芒。",
    "当雪莉将水晶带回神殿时,长老们对她的勇气和智慧赞叹不已。",
    "他们将冰霜王冠轻轻地放在了她的头上,王冠散发出耀眼的光芒。",
    "仿佛它也感受到了这位新公主的品德和勇气。",
    "然而,就在这时,雪莉做出了一个令所有人震惊的决定。",
    "她摘下了头上的王冠,放弃了公主的身份。", "她深知宫廷的束缚和控制。",
    "她不愿被权力所困,更不愿失去自己的自由。",
    "于是,在众人惊讶的目光中,雪莉转身离开了神殿。",
    "她选择了自己的道路,成为了一个普通人,过着简单而自由的生活。", "冰冠的故事结束"},

    halo = { -- 血环的故事
    "血冠,如其名,是由罕见的血色宝石与未知金属锻造而成,\n通体散发着妖异而诱人的红光,仿佛能洞察人心最深处的欲望与恐惧。",
    "与冰霜王冠的纯净不同,血冠的每一道光芒都透露着不祥的气息,它既是力量的源泉,也是灵魂的枷锁。",
    "传说,血冠曾是古代一位暴君的专属之物,他通过无尽的战争与掠夺,收集了世间最邪恶的力量,将其注入这顶王冠之中。",
    "戴上血冠之人,将获得前所未有的力量与智慧,但同时也将承受无尽的痛苦与诅咒,\n因为血冠会不断吸取佩戴者的生命力与灵魂精华,以满足其无尽的贪婪。",
    "然而,随着时间的流逝,暴君的统治被推翻,血冠也被封印在了一个无人知晓的秘境之中,以免其再次落入邪恶之手。",
    "但关于血冠的传说却从未消失,它像一个幽灵般徘徊在王国的边缘,吸引着那些渴望力量与权力的人。",
    "雪莉,这位已经掌控了冬之刃与血之刃力量的公主,意外地得知了血冠的存在。",
    "她深知,这么强大的东西不应该存在王国里,于是,她决定踏上寻找血冠的征途。",
    "雪莉深入幽暗的密林,穿越危险的沼泽,最终来到了封印血冠的秘境。",
    "见到了那充满可怕气息的血冠,尽管如此雪莉依然拿起了它",
    "她面对着内心的挣扎与恐惧,因为她知道,一旦戴上血冠,她可能会失去自我,成为下一个被诅咒的暴君。",
    "但为了王国的安全,她毅然决然地戴了上去。",
    "当血冠缓缓落在雪莉的头顶时,整个秘境仿佛都为之颤抖。",
    "血冠的光芒瞬间笼罩了她的全身,她感受到了前所未有的力量与智慧,但同时也感受到了来自灵魂深处的痛苦与挣扎。",
    "这可怕的力量貌似就要将雪莉心智彻底吞噬。",
    "雪莉不敌这可怕的力量，随后晕了过去。",
    "这时佩戴在雪莉身上的冬之刃和血之刃同时涌现出力量。",
    "支撑着雪莉一同抵抗血环的侵蚀,时间过去许久。",
    "血环没有将雪莉吞噬，反倒开始治疗起雪莉。",
    "随着时间的流逝，雪莉在冬之刃和血之刃的守护下渐渐恢复了意识。",
    "当她再次睁开眼睛时，眼前的景象让她既惊讶又感动。",
    "血冠的红光已经不再那么妖异，而是变得柔和而温暖，仿佛它内部的力量正在经历一场蜕变。",
    "雪莉感到自己与血冠之间建立了一种奇妙的联系，\n她能够感知到那股曾经试图吞噬她的邪恶力量，但此刻它们却变得温顺而驯服。",
    "她意识到，是冬之刃的纯净与血之刃的坚韧，以及她自己的勇气与决心，共同打破了血冠的诅咒。",
    "从此以后，血冠的传说不再是王国边缘徘徊的幽灵。",
    "雪莉，这位掌控了冬之刃、血之刃并掌控血冠的公主，也被他人永远铭记。"},

    card = { -- 学生卡的故事   
    "在寒冷的冬日,阳光透过晶莹剔透的雪花。", "魔法学院和往常一样举行考试。",
    "不过呢一个令人哭笑不得的故事即将上演。", "主角就是我们小迷糊的雪莉。",
    "就在早上,雪莉准备从寝室到教室,准备参加一场重要的模拟考试。",
    "可是,当她走进考场时,却发现了一个大问题——她忘记带学生卡了！",
    "在考场门口,考试老师严肃地盯着雪莉,要求她出示学生卡。",
    "雪莉一下子慌了神,她翻遍了书包、口袋,甚至把外套都脱了下来。",
    "但始终没有找到那张小小的卡片。",
    "她急得满头大汗,嘴里不停地念叨着:“学生卡,我的学生卡到底在哪里啊？”",
    "就在这时,雪莉的同桌迪维尔(Deville)看到了她的窘境。",
    "迪维尔是个调皮捣蛋的家伙,他眼珠一转,计上心头。",
    "他悄悄地从口袋里掏出自己的学生卡,趁监考老师不注意,一把塞进了雪莉的手里。",
    "迪维尔已经在后面准备好看雪莉的笑话了。",
    "雪莉拿到卡后,感激地看了小明一眼,然后迅速地走进了考场。",
    "可是,当她坐下后仔细一看,却发现这张学生卡上写着“迪维尔”的名字和照片！",
    "她顿时傻眼了,心想:“这下完了,我怎么会拿着迪维尔的学生卡来考试呢？”",
    "就在这时,考试老师走了过来,准备检查雪莉的证件。",
    "雪莉紧张得手心冒汗,她硬着头皮把那张写着“迪维尔”名字的学生卡递给了老师。",
    "老师接过卡片,仔细地看了起来,因为老师是近视的原因又刚好把眼镜放到讲台上了。",
    "只好看学生证上的照片,老师盯着看了一会儿后。",
    "便开口询问道:“雪莉的你的头发不是蓝色的吗？为什么照片上的你是红头发？”",
    "本来就紧张的雪莉一听老师的询问,变得更紧张了。",
    "雪莉紧张得结结巴巴地说:“那个.....我...那次戴了一个红色的帽子”。",
    "老师说:“迪维尔你去把我的眼镜拿下来”",
    "迪维尔听到过后简直乐开了花,又跑又跳的把眼镜拿下来交给了老师。",
    "老师刚戴上眼镜,学生卡没拿稳掉到了地上。",
    "雪莉慌慌忙忙的就要去捡,就在她弯腰的时候撇了一下自己课桌里面。",
    "课桌里面就放着自己的学生卡,雪莉飞快的进行了调换。",
    "将自己的学生卡交给老师检查确认没有问题后,这才松了口气。",
    "随后老师就要检查迪维尔的学生卡,这时迪维尔脸都绿了",
    "迪维尔的笑容并没有消失,而是跑到了雪莉脸上。",
    "当然迪维尔最后的肯定躲不了老师的处罚。",
    "迪维尔站在讲台上,脸上原本狡黠的笑容已经消失得无影无踪。",
    "取而代之的是一副懊悔和尴尬的表情。",
    "老师严肃地看着他,手中的教鞭轻轻敲打着讲台。",
    "发出清脆的响声,让整个教室的气氛都紧张了起来。",
    "“迪维尔,你知道你做了什么吗？”老师的声音虽然不高,但却充满了威严。",
    "迪维尔低着头,小声地说:“我……我知道,我不应该把自己的学生卡给雪莉,还故意让她被误会。”",
    "“你的行为不仅影响了雪莉的考试,也破坏了考场的纪律。”",
    "老师继续说道,“作为魔法学院的学生,你应该明白诚实和尊重他人的重要性。”",
    "迪维尔点点头,表示明白。", "老师问雪莉怎么惩罚迪维尔",
    "雪莉说:“我选择原谅迪维尔”", "老师听后,有些惊讶地看着雪莉。",
    "对迪维尔说:“既然雪莉愿意原谅你,那么这次就算了。",
    "迪维尔感激地看着雪莉,心中充满了感激和愧疚。",
    "他知道,是雪莉的宽容和大度给了他改过自新的机会。", "学生卡的事情画上句号"},

    feather_robin_winter = { -- 羽毛背包的故事
    "在魔法学府的图书馆里,雪莉找到了几本古老的手稿。",
    "这些手稿详细记录了羽毛背包的制作过程。",
    "根据手稿所述,制作羽毛背包需要收集雪雀的羽毛。",
    "这些羽毛不仅需要经过特殊的魔法处理,还需要在特定的时间和地点编织才能成功。",
    "幸运的是,雪雀生活在学府后面的雪山里,那里终年被冰雪覆盖。",
    "虽然学府的老师和同学们都愿意帮助她,但雪莉决定独自一人前往。",
    "旅途虽然艰辛,但因为离学府不远,雪莉很快就来到了雪山脚下。",
    "她穿越了茫茫的雪原,克服了严寒和暴风雪。",
    "终于在山顶的一片宁静的山谷里发现了雪雀的栖息地。",
    "山谷中,雪雀们自由自在地飞翔,洁白的羽毛在阳光下闪闪发光。",
    "herry小心翼翼地接近它们,用温柔的声音和友善的魔法与雪雀们沟通。",
    "最终,一只年长的雪雀信任了她,愿意赠予她几根珍贵的雪雀羽毛。",
    "带着雪雀的羽毛,雪莉返回了魔法学府。",
    "在一个满月之夜,她在湖边开始了羽毛背包的编织。",
    "她运用了从手稿中学到的每一个细节,用魔法将羽毛融合在一起。",
    "随着最后一根羽毛被编织完成,羽毛背包闪烁着微光,充满了魔法的力量。",
    "雪莉背上了羽毛背包,感受到了它的轻便。",
    "她尝试装入书籍和其他物品,发现不论装多少东西。",
    "背包都不会变重,仿佛所有的重量都消失了。",
    "这使得她在学府的日常生活变得更加轻松。",
    "通过这次独自的冒险和制作羽毛背包的过程。",
    "帮助她在追求魔法知识的道路上越走越远。", "羽毛背包故事结束"},
    bearger_fur = { -- 小熊书包的故事
    "一天,小熊在森林深处发现了一只奇特的小熊书包。",
    "这只书包不同于普通的背包,它有着柔软的蓝色布料。",
    "上面绣着可爱的熊头图案,仿佛是为了它量身定做的一般。",
    "小熊立刻喜欢上了这只小熊书包。",
    "随后它便准备回家,在途中听到了人们的欢声笑语。",
    "它偷偷的躲在后面偷偷注释大家。", "原来是雪莉和班级里的同学们展开的户外活动。",
    "小熊想靠的更近些,但雪莉这时发现了异样。",
    "随后往小熊的方向望去,小熊发现不对后想要逃跑。",
    "但是动静太大了,让本就觉得奇怪的雪莉更好奇了。", "雪莉便偷偷跟了上去。",
    "小熊在逃跑的过程中经过一片沼泽地时,不小心滑到了。",
    "陷入了泥潭中。小熊挣扎着想要站起来,但泥潭的吸力让它无法动弹。",
    "就在这时,雪莉也发现了小熊的困境。", "她迅速冲上前去,用尽全力拉住了小熊。",
    "好在小熊并不重,雪莉费了一番力气后,终于将小熊从泥潭中救了出来。",
    "小熊被雪莉救起后,感激不已。",
    "它用那双圆圆的眼睛看着雪莉,仿佛在表达着深深的谢意。",
    "为了感谢雪莉的救命之恩,小熊决定将自己最喜欢的小熊书包送给雪莉。",
    "雪莉接过小熊书包,开心地笑了。",
    "她抚摸着书包上可爱的熊头图案,感受到了小熊的真诚。",
    "远处传来了同学的呼喊,雪莉表示感谢后便离开了。", "最后小熊目送雪莉归队。",
    "小熊书包的故事结束", " 小熊书本故事结束"},
    valise = { -- 手提箱的故事
    "雪莉自从进入魔法学府后,对魔法的热爱与日俱增。",
    "她不仅努力学习各种魔法知识,还希望能拥有一件属于自己的魔法物品来辅助她的学习。",
    "然而,由于她的经济条件有限,购买魔法物品对她来说只能是一个想法。",
    "在一次偶然的机会中,雪莉得知魔法学府的市集上有一家魔法物品店正在招聘助手。",
    "她心想,这或许是一个能够接触并了解魔法物品的好机会,于是毫不犹豫地前去应聘。",
    "店主是一位年迈的魔法师,他看中了雪莉的勤奋和对魔法的热爱。",
    "决定给她一个机会,从此,雪莉便开始了在魔法物品店的工作。",
    "在店里,雪莉不仅学会了如何鉴别和修复魔法物品。", "同样也可以雪莉魔法知识。",
    "她发现,每一件魔法物品背后都有着一个独特的故事和魔法力量。",
    "在工作的过程中,雪莉表现出色,不仅帮助店主解决了许多棘手的问题。",
    "还主动承担起店铺的日常管理工作。",
    "店主对她的能力和态度赞赏有加,决定给她一个特别的奖励。",
    "一天,店主将雪莉叫到身边,从背后拿出了一个精致的手提箱递给她。",
    "他告诉雪莉,这只手提箱是一件非常罕见的魔法物品。",
    "它能够储存你的好多好多东西。",
    "由于雪莉在店里的出色表现和对魔法的热爱,他决定将这个手提箱作为对她的奖励。",
    "雪莉惊喜万分,她接过手提箱,感受到其中散发出的温暖光芒。",
    "她知道,这是店主对她的肯定和鼓励,也是她努力和坚持的结果。",
    "雪莉知道只要不断努力和追求梦想,就一定能够创造出属于自己的奇迹。",

    "手提箱的故事结束。"}
}

local story_table_en = {

    default = { -- default story
    "The story of Sherry is told by default. \nPut the exclusive prop in the first slot of the inventory to start telling the story of this prop.\n The two schoolbags are replaced with blue feathers and bear skins.",
    "Sherry's story begins",
    "A long time ago, in a magical kingdom, there lived a beautiful but lonely princess named Sherry.",
    "She possesses powerful magical abilities, but due to her parents' overprotection, Sherry is trapped in a gorgeous but cold palace, unable to freely explore and use her magic.",
    "Although surrounded by servants and guards, Sherry always felt like a bird trapped in a golden cage, unable to spread its wings and fly.",
    "Sherry's hobby is reading, and she is always immersed in the books in the palace library.",
    "One day, she accidentally discovered an ancient magic book, which mentioned a pair of mysterious glasses decorated with snowdrops.",
    "Legend has it that wearing it can change a person's appearance, but at the same time invalidate all her magic.",
    "Sherry realized that these glasses might be her only chance to escape the palace.",
    "After several days of searching, Sherry finally found the pair of mysterious glasses stored on the display cabinet in a hidden corner of the palace.",
    "First, I looked around and secretly took off my glasses after making sure no one was around.",
    "She put on her glasses and immediately felt that her appearance had changed, becoming ordinary, and her magic also disappeared in an instant.",
    "At this moment, the guard who happened to be passing by noticed Sherry.",
    "Because Sherry wore glasses, the guards didn't recognize that this was Princess Sherry.",
    "He roared loudly: \"Who are you? Why are you here? \"", "Sulli quickly realized that her appearance had changed.",
    "Seeing a broken sword under the display cabinet, she didn't hesitate, picked up the sword and put it in her clothes.",
    "Then she hurriedly lowered her head to hide her face and replied incoherently: \"I...I am the new servant here and I am lost. \"",
    "The guard frowned, looking a little impatient, but didn't think much about it.",
    "He waved his hand and signaled her to leave quickly: \"This is not the place you should be here, go away! \"",
    "Sherry felt her heart beating wildly, but she tried to stay calm, even as she tightened her grip on the hilt of the sword.",
    "After leaving the guard's sight, she quickly moved towards the back door of the palace.",
    "She knows that the back door, which is usually less guarded, is her best way to escape.",
    "After careful avoidance, Sherry finally came to the back door.",
    "She looked around and found that only one guard was dozing.",
    "Sherry held her breath, gently opened the door, and slipped out quietly.",
    "As soon as she stepped out of the palace gate, Sherry felt relaxed, but she knew that now was not the time to relax.",
    "She must get away from this place as soon as possible and find a safe hiding place.",
    "Under the cover of darkness, she trotted all the way, and finally came to a meadow full of flowers after dawn.",
    "Here, a group of young people are happily playing musical instruments and singing.",
    "Sherry hid behind a big tree and listened silently. A strong desire arose in her heart, eager to be as free as they were.",
    "At this moment, a young man discovered her existence.",
    "His name is Helen Han. He is a warm-hearted guy who is good at detecting other people's emotions.",
    "He approached Sherry and asked gently: \"Why are you hiding here? \"",
    "Sherry was very cautious and hesitated, but she saw sincerity in Helen Han's eyes.",
    "So he made up a lie: \"I am just an ordinary person who has become homeless due to family reasons.\"",
    "After hearing this, Helen Han sympathized with Sherry very much and decided to help her find her own life in the new world.",
    "Helen Han saw Sherry wearing glasses and guessed that she loved knowledge, so she asked: \"You must be eager for knowledge, right?\" ",
    "Face this question, Sherry just nodded.", "Helen Han took her to a magic academy after understanding it.",
    "This academy accepts anyone who loves magic and knowledge.",
    "The admission procedure is relatively simple, and Helen Han prepared all the necessary documents for Sherry.",
    "All the admission procedures were passed successfully.",
    "I got the necessary student cards and some books, and officially started my study life.",
    "During this period, because Sherry was wearing glasses, her magical ability was sealed, and her appearance looked ordinary.",
    "Everyone thought she was a new student with no magical talent.",
    "While living in the magic academy, Sherry accidentally discovered a book that was pressed under the corner of the table.",
    "Its cover exuded a mysterious light that attracted her attention.",
    "The pages of the book contain a mysterious magic called the \"Eternal Realm\".",
    "Sherry was deeply attracted by the descriptions in the book and was eager to explore a wider world.",
    "So she opened the pages of the book curiously and began to read the contents.",
    "As her eyes passed over the words, a mysterious power surged on the pages, seeming to be calling her.",
    "Suddenly, a dazzling white light burst out from the pages of the book, covering Sherry's entire body.",
    "She felt that her body was being drawn into the white light uncontrollably, and her consciousness gradually became blurred... ",
    "When Sherry opened her eyes again, she found herself in a fantasy and mysterious world -the eternal realm."},

    broken_sword = { -- The story of the broken sword
    "Under the shadow of the storage display cabinet, an ancient and solemn sword lies there quietly.",
    "The blade of the sword has lost its former luster, but it still exudes a unique charm that has accumulated over the years.",
    "That's why it is not ordinary, it is the sword of princesses of all ages",
    "It was just once when I was protecting the princess. Because the service life was approaching, cracks finally appeared and broke.",
    "Although it has gone through many hardships, it still makes people feel awe.",
    "Although Sherry has become an ordinary person at this time, her identity is still a princess.",
    "Sherry didn't know that only princesses could wear this broken sword that had been gathering dust for a long time.",
    "The guard noticed Sherry's unusual behavior and frowned.",
    "He walked up to Sherry and asked her to leave as soon as possible after making sure there were no problems.",
    "Then the guard walked into the room where the display cabinets were stored, wanting to check if there was anything abnormal.",
    "His eyes were quickly attracted to the empty scabbard under the display case.",
    "His eyes widened and he realized that the girl who claimed to be the new servant just now was actually the one who stole the princess's sword.",
    "He immediately chased her out, but Sherry had disappeared without a trace.",
    "After escaping from the palace, Sherry still carried this broken sword.",
    "While escaping, Sherry held on to the seemingly dilapidated broken sword.",
    "However, in her hands, the sword seemed to be revitalized.",
    "Although the sword is broken, it looks extremely sharp in Sherry's hands.",
    "She didn't know why the sword became so different in her hands.",
    "It seemed to have some strange resonance with her.",
    "Later, with the help of Helen Han, I will successfully enroll in school and ensure the safety of the school.",
    "She stored that unusual broken sword. She knew very well how extraordinary this sword was.",
    "Keep it properly when you don't need it to avoid unnecessary trouble.",
    "After being transported to the eternal realm by the magic book.",
    "When she regained consciousness, she was surprised to find.",
    "The broken sword that she had stored in the school actually appeared here with her.",
    "She had no choice but to find a way to survive here.",
    "Sherry discovered that this broken sword can not only protect herself in danger, but can also be used as a tool.",
    "In the realm of eternity, Sherry and this broken sword experienced many adventures and challenges together.",
    "What will Sherry go through next? No one knows.",
    "But this broken sword will still stick to its mission and protect Sherry when she needs it."},
    winter_sword = { -- The Story of Winter's Blade
    "There used to be a legend about a magical sword called the \"Winter Blade\".",
    "This sword is the sword of the princesses of all generations. It has witnessed one princess after another.",
    "The blade of the Winter Blade shines like frost, and the sword is so sharp that it seems to be able to split the strongest ice and snow.",
    "However, as time passed, the Winter Blade also experienced countless battles and wear and tear.",
    "In the end, it broke due to the huge impact during a fierce battle to protect the princess.",
    "In the end, I don't know how many years passed, but the Blade of Winter was gradually forgotten.",
    "It has been stored in a display cabinet deep in the kingdom.",
    "Who would have known that Princess Sherry discovered it by accident.",
    "She doesn't know the history of this broken sword, and no one has ever mentioned it to her.",
    "In the eternal realm, I have always been with Sherry.", "There are changes in the four seasons here.",
    "The time has come to winter soon.",
    "One night, as usual, when Sherry was preparing to rest, the hilt of the sword emitted a blue light.",
    "Telling what was needed, Sherry seemed to understand the meaning.",
    "Sherry held the broken sword tightly. Although she had many questions in her heart, she closed her eyes.",
    "At this time, the sword began to heal and the cracks disappeared.",
    "It becomes as smooth and bright as a new one.", "It feels very light to hold it.",
    "The Blade of Winter is reborn in Sherry's hands.",
    "After rebirth, the Winter Blade not only regained its former glory, but also gained greater power.",
    "Different from the previous Broken Sword, when facing more powerful monsters.",
    "The Blade of Winter has unparalleled power and can easily defeat the enemy.",
    "As time goes by, Sherry gradually masters the power of the Winter Blade.",
    "In the eternal realm, she and the Winter Blade experienced many adventures and challenges together.",
    "She understands that this sword is not only her weapon, but also her guardian.",
    "It also proves the legend that it is the sword of the princesses of all dynasties.",
    "Even if the Winter Blade breaks during use, it will only become a broken sword instead of disappearing.",
    "Sherry can fix it every time it breaks if she wants to."},

    blood_sword = { -- The story of Blood Blade
    "In the legend, in addition to the Blade of Winter, which symbolizes purity and rebirth, there is also a mysterious sword called the “Blood Blade”.",
    "The Blood Blade is a contemporary product of the Winter Blade, but its power comes from darkness and blood.",
    "The blade of this sword glows with a dark red light, and the blade is extremely sharp. It seems to be able to absorb the soul of every enemy who falls in front of it.",
    "According to legend, the Blood Blade was originally held by a cursed prince who risked his life and soul to protect his kingdom.",
    "The Blood Blade has become more and more powerful in countless battles, but it has also gradually been feared by people.",
    "In the end, the prince died in a decisive battle, and the Blood Blade was sealed deep in an ancient temple.",
    "As time goes by, the story of the Blood Blade is gradually forgotten, and only a few ancient books still record its legend.",
    "One day, Princess Sherry accidentally entered the forgotten temple during her exploration and discovered the Blood Blade.",
    "When she approached the sword, the Blood Blade actually made a low buzzing sound, as if calling her.",
    "Although she was a little scared, Sherry felt an irresistible force and she grasped the hilt of the Blood Blade.",
    "In an instant, countless scenes of past battles and the sacrifice of that prince flashed before her eyes.",
    "The Blood Blade absorbed Sherry's blood, and the cracks on the sword began to heal, becoming even more shining.",
    "Although the Blood Blade gave Sherry unparalleled power, she also felt that the dark power in the sword was trying to corrode her soul.",
    "Despite this, she can only try her best to reduce the erosion of the Blood Blade on her, but she still cannot completely eliminate its influence.",
    "She understands that the Blood Blade is not only a weapon, but also a responsibility and test.",
    "The Blade of Blood and the Blade of Winter symbolize the light and darkness of the kingdom. Only by balancing the two can we protect ourselves and others.",
    "Sherry not only controlled the frost power of the Winter Blade, but also tried her best to tame the dark power of the Blood Blade."},

    paper = { -- test paper story story
    "While in the magic academy, Sherry was passionate about magic.",
    "But her mind is always erratic, like a dandelion swaying in the wind.",
    "It has almost become her daily habit to run away from work. Every time the teacher gives a lecture, Sherry's thoughts have already drifted to the sky.",
    "Finally, during an important exam, Sherry's habit of deserting brought her a lot of trouble.",
    "The questions on the test paper were like insurmountable mountains to her.",
    "She thought hard, but still couldn't figure it out.",
    "At this moment, she caught a glimpse of the test paper of the classmate next to her.",
    "Sherry's heart moved and she decided to take a risk and secretly copy it.",
    "She moved her eyes carefully for fear of being discovered by the invigilator.",
    "However, because she was so nervous, her hand shook and she even copied down the classmate's name!",
    "When the test paper was put away, I suddenly saw that my name was not on it, and Sherry's heart was already hanging in her throat.",
    "In the following days, she prayed that the teacher would not discover this little secret.",
    "However, fate always seems to like to play tricks on her.",
    "Not long after, the test papers were handed out, and there was a big 0 written on Sherry's test paper,",
    "There is also a note next to it: \"You have to use your head when copying homework, and you will be punished for cleaning next time.\"",
    "Sherry looked at this dazzling 0 points and naturally felt uncomfortable.",
    "She realized that she couldn't go on like this anymore and had to get rid of her bad habit of desertion.",
    "So, she made up her mind to work hard to improve her learning level.",
    "Of course, Sherry has not forgotten the classmate who gave her a 0-point lesson.",
    "She took the initiative to find the classmate, sincerely apologized to her, and thanked her for making her realize her mistake.",
    "Since then, Sherry seems to have changed. She listens carefully in class and practices diligently after class.",
    "Whenever she wants to desert, she will think of that 0-point lesson and remind herself to concentrate on her studies.",
    "This ends the story of 0 points."},

    snow_finch_fan = { -- The story of Snow Bird Fan
    "As usual, Sherry was in the college library looking for books to read.",
    "But I accidentally discovered an ancient book that had been dusty for a long time.",
    "This book seems to have been rarely read and is covered with thick dust.",
    "She opened the book curiously and found that there was a powerful magic item called the “Snowbird Fan” recorded in the book.",
    "According to the description in the book, the Snowbird Fan can not only summon powerful hurricanes, but can also control the surrounding temperature.",
    "Sherry was so fascinated that she decided to try making this snowbird fan following the instructions in the book.",
    "The book mentions that making a snowbird fan requires a very rare material -snowbird feathers.",
    "This feather can only be found on a legendary snowfinch from the Far North.",
    "After some thought, Sherry decided to embark on an adventure to find ice crystal feathers.",
    "Sherry was fully prepared, took her most trusted broken sword and some necessary daily necessities, and set off towards the far north.",
    "During the long journey, Sherry experienced all kinds of hardships: she crossed endless glaciers,",
    "Escaped from ferocious ice beasts and fought against hunger and loneliness in the extremely cold weather.",
    "However, she never gave up.",
    "Finally, on a bright moonlit night, she saw the legendary snowbird in a quiet snowfield.",
    "The snowbird's wings are as white as an angel descending.",
    "Its eyes are pure and flawless, and it seems to be able to see through everything.",
    "Sherry held her breath and cautiously approached the snowbird.",
    "She explained her intention to Xueqiao carefully and showed her sincerity and courage.",
    "The snowbird seemed to sense Sherry's determination, and flapped its wings gently, dropping a feather that shone with ice blue light.",
    "Sherry was holding the ice crystal feathers and was very excited.",
    "She finally found the last piece of the puzzle to make the snowbird fan.",
    "After returning to the academy, Sherry followed the steps in the ancient book and carefully embedded the ice crystal feathers into an exquisite fan.",
    "With the completion of the last magic spell, the Snowbird Fan emits a dazzling light.",
    "The airflow around the Snow Bird Fan seems to be surging with the magic power.",
    "Summon a powerful hurricane, and no monsters can get close.",
    "I don't think anyone would want to easily offend the owner of the snowbird fan"},

    paper_plane = { -- The story of paper airplane
    "The sun shines on Sherry's face, and in her hand she holds tightly a 0-point test paper that was just handed out.",
    "Sherry was filled with frustration and embarrassment. She never thought she would end up like this.",
    "Just a few days ago, Sherry chose to cheat because she was too stressed about the exam.",
    "She carefully copied the test papers of the classmates next to her, but due to nervousness and lack of experience.",
    "She accidentally copied down her classmates' names as well.",
    "As you can imagine, Sherry got a dazzling 0 score and became a laughing stock in front of the whole class.",
    "Sherry was sitting in the classroom, looking at the 0-point test paper, with mixed feelings in her heart.",
    "She felt ashamed and remorseful, but also angry at her carelessness.",
    "At this moment, she suddenly had an idea -use this test paper to make a paper airplane.",
    "Sherry carefully unfolded the test paper and then started to fold the paper according to the steps in memory",
    "Her fingers flew flexibly on the test paper, and soon, a delicate paper airplane was completed.",
    "The paper plane shone brightly in the sun, as if mocking her failure.", "However, Sherry was not discouraged.",
    "She looked at the paper airplane in her hand, and an inexplicable power surged in her heart.",
    "She realized that although this 0-point test paper brought her frustration and embarrassment, it also gave her a chance to start over.",
    "Then the paper airplane was thrown into the sky with great force.",
    "Watching the paper plane flying freely in the blue sky, Sherry seemed to feel her soul flying.",
    "As time went by, Sherry's magic level gradually improved, and her grades began to rise steadily.",
    "She no longer needs to cheat to get good grades, but has won the respect and admiration of her classmates with her own hard work and strength.",
    "And the paper airplane folded from the 0-point test paper.",
    "It also became an important witness on Sherry's learning path.",
    "Origami airplanes have become a habit of Sherry's, whenever she feels stressed.",
    "Everyone folds a paper airplane and throws it hard.", "The end of the paper airplane story"},
    story_book = { -- 故事书的故事
    "Sorry it's not available here."},

    glasses = { -- The story of glasses
    "The mysterious snowdrop glasses in the story",
    "Once upon a time there was a legend about the mysterious snowdrop glasses.",
    "This pair of glasses is not an ordinary accessory, but a mysterious object that contains powerful magic.",
    "According to legend, these glasses were originally forged by an ancient and powerful magician.",
    "He discovered the mysterious snow lotus in an accident. This snow lotus contains powerful power.",
    "The magician used this snowdrop and years of magical knowledge to create these glasses.",
    "When someone puts on these glasses, the magic of the glasses will be quietly released.",
    "The material of glasses is light, although it makes the wearer smarter.",
    "But wearing it for the first time will deprive the wearer of her magical power, causing her to instantly lose all magical abilities.",
    "Subsequently, the glasses change the wearer's appearance, making them ordinary and unrecognizable.",
    "The magic of these glasses is so powerful that no one dares to try to wear them.",
    "It was regarded as a taboo existence and was stored in a corner of the palace. Only a few people knew of its existence.",
    "Sherry discovered the existence of glasses while reading in books, and she knew that this was her chance to escape from the palace.",
    "After much searching, I successfully found the glasses.",
    "Taking the glasses from the display cabinet, Sherry put them on without hesitation.",
    "The moment Sherry put on her glasses, she felt a powerful force pouring out of her glasses and instantly enveloped her.",
    "Her consciousness began to become blurred, and her magical power was rapidly draining.",
    "The magic of the glasses did not last long.",
    "When she opened her eyes again, she was surprised to find that she was no longer the same.",
    "Her appearance became ordinary, and her magical power disappeared without a trace.",
    "This did not frighten her, she knew this was her chance.",
    "Escape from the palace by evading the guards seemed easy.",
    "In fact, it's all thanks to the glasses, because the glasses have been secretly helping Sherry.",
    "After some wonderful experiences, Sherry successfully enrolled in school.",
    "While wearing glasses can make you smarter, it doesn't make you more diligent.",
    "Sherry's grades in school were not ideal, which also gave her a headache.",
    "But an accidental cheating made Sherry change some bad habits.",
    "These accidents seem to be accidental, but no one would know.",
    "It has always been the magic of snowdrop glasses.", "But it's all Sherry's decision."},

    ribbon_hat = { -- The story of ribbon hat
    "Sherry is a little-known ordinary student.",
    "She is not as dazzling as those talented classmates, and she does not have dazzling magical talents.",
    "In every magic class, she tried her best to keep up with the professor's explanations and tried her best to memorize the complicated spells, but her spellcasting was always unsatisfactory.",
    "One day, Sherry was sorting out old books in the college library, and a dusty small box in the corner caught her eye.",
    "Out of curiosity, she opened the box and found an ancient ribbon hat inside.",
    "This hat looks ordinary, but it emits a weak wave of magic power.",
    "Maybe it's just an old hat of a certain student. Sherry whispered to herself, but she couldn't help but put it on.",
    "In an instant, Sherry felt a warm power pouring into her body, as if some power that had been dormant for a long time was awakened.",
    "She raised her hands and recited an ice crystal spell that she had been unable to cast successfully.",
    "To her surprise, ice crystals instantly formed in her palm, which were brighter and more stable than any magic she had cast before.",
    "Sherry's heartbeat accelerated.",
    "She began to try more spells, each one casting smoother and more powerfully than the one before.",
    "This ribbon hat seems to guide her, directing her magic to a higher realm.",
    "Sherry's performance improved dramatically from that day on.",
    "Not only is she able to master complex spells, but she can also easily defeat opponents who once intimidated her in actual magical duels.",
    "Her little story began to spread in the college, and professors began to take notice of this originally inconspicuous student.",
    "However, Sherry was not proud of it.",
    "She knew that while the ribbon hat gave her power, it also brought responsibility.",
    "She began to research the origin of the hat and discovered that it once belonged to a great magician. It is said that the magician spent his entire life enchanting the hat in the hope of finding a truly potential heir.",
    "As Sherry's magic continues to grow, she also gradually realizes that the real power does not come from the hat, but from her own inner tenacity and belief.",
    "Eventually, she learned to cast powerful magic without relying on her ribbon hat.",
    "One day, Sherry carefully put the ribbon hat back into its original box and placed it again in the corner of the library.",
    "She understands that this hat will wait for the next person who deserves it, and she, by virtue of her own power, will become a great magician."},

    ice_crown = { -- ice cap story
    "There is an ancient legend that tells of a mysterious crown of frost.",
    "This crown is not an ordinary crown, but a symbol that symbolizes the dignity and strength of the princess of the kingdom.",
    "The story begins on a winter morning.",
    "In the palace of the kingdom, good news came: Sherry will accept the inheritance of the Frost Crown today.",
    "However, what is different from the past is that Sherry does not desire to be a princess, she just wants to live a simple and ordinary life.",
    "Sherry is a beautiful but lonely girl, but she loves the outside life.",
    "However, the tradition of the kingdom has doomed her fate.",
    "In an ancient temple, the Frost Crown is placed on a cold stone platform.",
    "This crown is made of pure crystal and cold ice, giving off an astonishing light.",
    "The elders of the kingdom gathered in the temple and began the inheritance ceremony.",
    "The inheritance ceremony is a trial, a test of the princess's courage, wisdom and character.",
    "Sherry was taken to an ancient forest, and her mission was to find the lost crystal.",
    "This crystal is not an ordinary gem, but the source of the soul of the kingdom. Only the princess can find it.",
    "In the dense woods, Sherry faced endless difficulties and challenges, but she never gave up.",
    "She used her courage and wisdom to gradually get closer to her goal.",
    "Finally, she found the shimmering crystal under an ancient giant tree.",
    "It radiates warmth like the heart of the kingdom.",
    "When Sherry brought the crystal back to the temple, the elders marveled at her courage and wisdom.",
    "They gently placed the Frost Crown on her head, and the crown glowed with dazzling light.",
    "It's as if it also senses the new princess's character and courage.",
    "However, at this moment, Sherry made a decision that shocked everyone.",
    "She took off the crown on her head and gave up her identity as a princess.",
    "She is well aware of the constraints and control of the palace.",
    "She doesn't want to be trapped by power, let alone lose her freedom.",
    "So, under the surprised eyes of everyone, Sherry turned and left the temple.",
    "She chose her own path and became an ordinary person, living a simple and free life.",
    "The end of Icecrown's story"},

    halo = { -- The story of the blood ring
    "The Blood Crown, as its name suggests, is forged from rare blood-colored gemstones and unknown metals. The whole body exudes a strange and alluring red light, \nas if it can penetrate the deepest desires and fears of the human heart.",
    "Unlike the purity of the Frost Crown, every ray of light in the Blood Crown reveals an ominous aura. It is both the source of power and the shackles of the soul.",
    "Legend has it that the blood crown was once the exclusive possession of an ancient tyrant. Through endless wars and plunder, he collected the most evil power in the world and injected it into this crown.",
    "A person who wears a blood crown will gain unprecedented strength and wisdom, but at the same time he will also endure endless pain and curses,\n because the blood crown will continue to absorb the wearer's vitality and soul essence to satisfy his endless greed.",
    "However, as time passed, the tyrant's rule was overthrown, and the Blood Crown was sealed in a secret realm that no one knew about, to prevent it from falling into the hands of evil again.",
    "But the legend about the Blood Crown has never disappeared. It lingers on the edge of the kingdom like a ghost, attracting those who desire strength and power.",
    "Sherry, the princess who has controlled the power of the Winter Blade and the Blood Blade, accidentally learned of the existence of the Blood Crown.",
    "She knew that such a powerful thing should not exist in the kingdom, so she decided to embark on a journey to find the Blood Crown.",
    "Sherry went deep into the dark forest, passed through the dangerous swamp, and finally came to the secret realm where the Blood Crown was sealed.",
    "After seeing the blood crown full of terrifying aura, Sherry still picked it up",
    "She faces her inner struggle and fear because she knows that once she wears the blood crown, she may lose herself and become the next cursed tyrant.",
    "But for the safety of the kingdom, she put it on resolutely.",
    "When the blood crown slowly fell on Sherry's head, the entire secret realm seemed to tremble.",
    "The light of the blood crown instantly enveloped her whole body. She felt unprecedented strength and wisdom, but at the same time she also felt the pain and struggle from the depths of her soul.",
    "This terrifying power seems to be completely swallowing up Sherry's mind.",
    "Sherry was unable to resist this terrifying power and then fainted.",
    "At this time, the Winter Blade and Blood Blade worn on Sherry emerged with power at the same time.",
    "It has been a long time supporting Sherry to resist the erosion of the blood ring.",
    "The blood ring did not devour Sherry, but began to heal Sherry.",
    "As time passed, Sherry gradually regained consciousness under the protection of the Winter Blade and the Blood Blade.",
    "When she opened her eyes again, she was surprised and moved by what she saw.",
    "The red light of the blood crown is no longer so eerie, but has become soft and warm, as if the power inside it is undergoing a transformation.",
    "Sherry felt a strange connection between herself and the Blood Crown. She could sense the evil forces that once tried to devour her, but now they had become docile and tame.",
    "She realized that it was the purity of the Winter Blade and the tenacity of the Blood Blade, along with her own courage and determination, that broke the Bloodcrown's curse.",
    "Henceforth, the legend of Bloodcrown is no longer a ghost lingering on the edge of the kingdom.",
    "Sherry, the princess who controlled the Winter Blade, the Blood Blade and the Blood Crown, will also be remembered forever by others."},

    card = { -- The story of student card
    "On a cold winter day, the sun shines through the crystal clear snowflakes.",
    "The Magic Academy held exams as usual.", "But a ridiculous story is about to unfold.",
    "The protagonist is our little confused Sherry.",
    "Just in the morning, Sherry was preparing to go from her dormitory to the classroom to take an important mock exam.",
    "However, when she walked into the examination room, she discovered a big problem -she forgot to bring her student card!",
    "At the entrance of the examination room, the examination teacher stared at Sherry seriously and asked her to show her student card.",
    "Sherry panicked all of a sudden. She rummaged through her schoolbag, pockets, and even took off her coat.",
    "But that little card was never found.",
    "She was so anxious that she was sweating profusely and kept mumbling: \"Student card, where is my student card?\" ",
    "At this moment, Sherry's deskmate Deville saw her dilemma.",
    "Deville is a naughty and mischievous guy. He turns his eyes and gets into his head.",
    "He quietly took out his student card from his pocket, and when the invigilator wasn't paying attention, he stuffed it into Sherry's hand.",
    "Deville is already back there, ready to laugh at Sherry's jokes.",
    "After Sherry got the card, she glanced at Xiao Ming gratefully and then quickly walked into the examination room.",
    "However, when she sat down and took a closer look, she found that the student card had the name and photo of \"Divell\" written on it!",
    "She was dumbfounded and thought: \"Now that it's over, how can I take the exam with Diville's student card?\" ",
    "At this moment, the exam teacher came over and was about to check Sherry's ID.",
    "Sherry was so nervous that her palms were sweating. She bit the bullet and handed the student card with the name \"Divell\" to the teacher.",
    "The teacher took the card and read it carefully. Because the teacher was short-sighted, he just put his glasses on the podium.",
    "I had to look at the photo on the student ID card. The teacher stared at it for a while.",
    "Then he asked, \"Sherry, isn't your hair blue?\" Why do you have red hair in the photo? \"",
    "Sherry, who was already nervous, became even more nervous when she heard the teacher's question.",
    "Sherry was so nervous that she stammered: \"Well... I... wore a red hat that time.\"",
    "The teacher said: \"Deville, go and take off my glasses\"",
    "After hearing this, Deville was so happy that he ran and jumped, took off his glasses and handed them to the teacher.",
    "The teacher just put on his glasses, and he lost his student card and dropped it to the ground.",
    "Sherry was about to pick it up in a hurry, but when she bent down, she glanced at the inside of her desk.",
    "There was her student card inside the desk, and Sherry quickly changed it.",
    "After giving my student card to the teacher to check and confirm that there was no problem, I breathed a sigh of relief.",
    "Then the teacher was about to check Diville's student card, and then Diville's face turned green.",
    "Deville's smile did not disappear, but ran to Sherry's face.",
    "Of course Deville will not be able to escape the teacher's punishment in the end.",
    "Deville stood on the podium, the original sly smile on his face had disappeared without a trace.",
    "Replaced by a look of regret and embarrassment.",
    "The teacher looked at him seriously, tapping the podium lightly with the pointer in his hand.",
    "There was a crisp sound, making the atmosphere in the entire classroom tense.",
    "Divell, \"do you know what you did?\" Although the teacher's voice is not high, it is full of majesty.",
    "Diveer lowered his head and said softly: \"I...I know that I shouldn't give my student card to Sherry and let her be misunderstood on purpose. \"",
    "\"Your behavior not only affected Sherry's exam, but also undermined the discipline of the exam room. \"",
    "The teacher continued, \"As a student of the Magic Academy, you should understand the importance of honesty and respect for others. \"",
    "Deville nodded to express his understanding.", "The teacher asked Sherry how to punish Deville",
    "Sherry said: \"I choose to forgive Deville.\"", "After hearing this, the teacher looked at Sherry in surprise.",
    "Said to Deville: \"Since Sherry is willing to forgive you, then forget it this time. ",
    "Deville looked at Sherry gratefully, his heart full of gratitude and guilt.",
    "He knows that it was Sherry's tolerance and generosity that gave him the chance to change his ways.",
    "The student card matter is over"},
    feather_robin_winter = { -- The story of the Feather Backpack
    "In the library of the Magic Academy, Sherry found several ancient manuscripts.",
    "These manuscripts detail the making of the feather backpack.",
    "According to the manuscript, making a feather backpack requires collecting snowbird feathers.",
    "Not only do these feathers need to be treated with special magic, they also need to be woven at a specific time and place to be successful.",
    "Fortunately, snowbirds live in the snowy mountains behind the school, which are covered with ice and snow all year round.",
    "Although the teachers and classmates at the school were willing to help her, Sherry decided to go alone.",
    "Although the journey was difficult, because it was not far from the school, Sherry quickly arrived at the foot of the snow-capped mountains.",
    "She crossed the vast snowfield and overcame the severe cold and blizzard.",
    "Finally, I discovered the snowfinch's habitat in a quiet valley on the top of the mountain.",
    "In the valley, snowbirds fly freely, their white feathers shining in the sun.",
    "Herry approaches them cautiously, using gentle voices and friendly magic to communicate with the snowbirds.",
    "Finally, an older snowbird trusted her and was willing to give her some precious snowbird feathers.",
    "With the snowbird feathers, Sherry returned to the Magic Academy.",
    "On a full moon night, she started knitting a feather backpack by the lake.",
    "She used every detail she learned from the manuscript to magically blend the feathers together.",
    "As the last feather is woven, the feather backpack shimmers with magical power.",
    "Sherry put on the feather backpack and felt how light it was.",
    "She tried loading books and other items and found that it didn't matter how much she packed.",
    "The backpack does not become heavier, as if all the weight has disappeared.",
    "This makes her daily life at the academy much easier.",
    "Through this solo adventure and the process of making a feather backpack.",
    "Help her go further and further in her pursuit of magical knowledge.", "End of Featherpack Story"},
    bearger_fur = { -- The story of the bear bag
    "One day, Little Bear found a strange Little Bear schoolbag deep in the forest.",
    "This schoolbag is different from ordinary backpacks. It has soft blue fabric.",
    "It has a cute bear head pattern embroidered on it, as if it was tailor-made for it.",
    "The little bear immediately fell in love with this little bear schoolbag.",
    "Then he prepared to go home and heard people's laughter on the way.",
    "It secretly hid behind and secretly commented on everyone.",
    "It turned out to be an outdoor activity carried out by Sherry and her classmates.",
    "The little bear wanted to get closer, but Sherry noticed something strange at this time.",
    "Then I looked in the direction of the little bear. The little bear realized something was wrong and wanted to run away.",
    "But the noise was too loud, which made Sherry, who was already feeling strange, even more curious.",
    "Sherry followed secretly.", "The little bear accidentally slipped while passing through a swamp while escaping.",
    "Trapped in the mire. The little bear struggled to stand up, but the suction of the mire prevented him from moving.",
    "At this moment, Sherry also discovered the plight of the little bear.",
    "She rushed forward quickly and pulled the little bear with all her strength.",
    "Fortunately, the little bear was not heavy. After a lot of effort, Sherry finally rescued the little bear from the quagmire.",
    "After the little bear was rescued by Sherry, he was very grateful.",
    "It looked at Sherry with its round eyes, as if expressing its deep gratitude.",
    "In order to thank Sherry for saving her life, Little Bear decided to give his favorite Little Bear schoolbag to Sherry.",
    "Sherry took the bear schoolbag and smiled happily.",
    "She stroked the cute bear head pattern on the school bag and felt the sincerity of the little bear.",
    "The shouts of classmates were heard in the distance, and Sherry expressed her gratitude and left.",
    "Finally, the little bear watched Sherry return to the team.", " 小熊书本故事结束"},
    valise = { -- suitcase story
    "Sherry's love for magic has grown day by day since she entered the magic academy.",
    "Not only does she work hard to learn various magical knowledge, she also hopes to have a magic item of her own to assist her learning.",
    "However, due to her limited financial conditions, purchasing magic items can only be an idea for her.",
    "By chance, Sherry learned that there was a magic item store in the market of the magic school that was recruiting assistants.",
    "She thought to herself that this might be a good opportunity to get in touch with and learn about magic items, so she applied for the job without hesitation.",
    "The shop owner is an old magician. He took a fancy to Sherry's diligence and love for magic.",
    "Decided to give her a chance, and from then on, Sherry started working in the magic item shop.",
    "In the shop, Sherry not only learned how to identify and repair magic items.", "She also learned about magic.",
    "She discovers that behind every magical item there is a unique story and magical power.",
    "During the work process, Sherry performed well and not only helped the store owner solve many difficult problems.",
    "He also took the initiative to take on the daily management of the store.",
    "The shop owner admired her ability and attitude very much and decided to give her a special reward.",
    "One day, the shop owner called Sherry to him and took out an exquisite suitcase from behind and handed it to her.",
    "He told Sherry that the suitcase was a very rare magical item.", "It can store a lot of your stuff.",
    "Due to Sherry's outstanding performance in the store and her love of magic, he decided to reward her with this suitcase.",
    "Sherry was so pleasantly surprised that she took the suitcase and felt the warm glow emanating from it.",
    "She knows that this is the store owner's affirmation and encouragement to her, and it is also the result of her hard work and persistence.",
    "Sherry knows that as long as she keeps working hard and pursuing her dreams, she will be able to create her own miracle.",

    "The story of the suitcase ends."}
}

-- 初始化故事索引
local story_indices = {
    default = 1,
    valise = 1
}

local function story(inst, reader)
    local story_table
    if TUNING.LANGUAGE == "English" then
        story_table = story_table_en
    else
        story_table = story_table_cn
    end

    local item = reader.components.inventory:GetItemInSlot(1)
    local selected_story
    local prefab_name

    if item then
        prefab_name = item.prefab

        if story_table[prefab_name] then
            selected_story = story_table[prefab_name]
        else
            selected_story = story_table.default
            prefab_name = "default"
        end
    else
        selected_story = story_table.default
        prefab_name = "default"
    end

    if not story_indices[prefab_name] then
        story_indices[prefab_name] = 1
    end

    local index = story_indices[prefab_name]
    reader.components.talker:Say(selected_story[index], 7)

    story_indices[prefab_name] = index % #selected_story + 1

    return true
end

-- 恢复能力
function recover(inst, reader)
    -- 检查并添加 talker 组件给玩家
    if not reader.components.talker then
        reader:AddComponent("talker")
    end

    -- 避免空腹
    if reader.components.hunger.current < 40 then
        reader.components.talker:Say(TUNING.LANGUAGE == "English" and "I have to eat too, right?" or
                                         "肚子是在太饿了。")
        return true
    end

    -- 检查是否有足够的 paper
    if not reader.components.inventory:Has("paper", 2) then
        reader.components.talker:Say(TUNING.LANGUAGE == "English" and "I need 2 papers" or "我得拿上2张卷子")
        return true
    end

    -- 消耗 paper 材料
    reader.components.inventory:ConsumeByName("paper", 2)

    -- 恢复理智值和消耗饥饿值
    reader.components.sanity:DoDelta(25)
    reader.components.hunger:DoDelta(-40)

    -- 恢复魔力值
    local equippedItem = reader.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
    local mana_recovery = equippedItem and equippedItem.prefab == "ribbon_hat" and 40 or 20
    if reader.components.mana then
        reader.components.mana:DoDelta(mana_recovery)
    end

    -- 输出恢复的信息
    reader.components.talker:Say(TUNING.LANGUAGE == "English" and
                                     string.format("My head is clearer and my magic value is restored to %d!",
            mana_recovery) or string.format("脑袋清醒些了,魔力值恢复%d！", mana_recovery))

    return true
end

-- 雨停
function weather(inst, reader)

    if not inst.components.talker then
        inst:AddComponent("talker")
    end
    -- 雨停需要满足200san值
    if reader.components.sanity.current < 199 then
        if inst.components.talker then
            if TUNING.LANGUAGE == "English" then
                inst.components.talker:Say(
                    "                                              You need >= 200 san points to do it.")
            else
                inst.components.talker:Say(
                    "                                              需要san值大于200点才可以。")
            end
        end
        return false
    end
    -- 停止下雨
    local season_manager = GetSeasonManager()
    if season_manager then
        if season_manager:IsRaining() then
            if not reader.components.inventory:Has("bluegem", 2) then
                if reader.components.talker then
                    -- 需要消耗材料才行
                    if TUNING.LANGUAGE == "English" then
                        reader.components.talker:Say("Requires 2 sapphires")
                    else
                        reader.components.talker:Say("需要用到2颗蓝宝石")
                    end
                    return true
                end
            end
            reader.components.inventory:ConsumeByName("bluegem", 2)
            season_manager:StopPrecip()
            if TUNING.LANGUAGE == "English" then
                reader.components.talker:Say("The rain stopped")
            else
                reader.components.talker:Say("雨停了")
            end
            reader.components.sanity:DoDelta(-50)

        else
            -- 启用下雨  season_manager:StartPrecip()

            if TUNING.LANGUAGE == "English" then
                reader.components.talker:Say("Just let the rain stop")
            else
                reader.components.talker:Say("只能让雨停")
            end
        end
    end
    return true
end

-- 季节切换
function season(inst, reader)
    if not inst.components.talker then
        inst:AddComponent("talker")
    end
    -- 需要250点san值
    if reader.components.sanity.current < 249 then
        if inst.components.talker then
            if TUNING.LANGUAGE == "English" then
                inst.components.talker:Say(
                    "                                              It requires a san value of 250 points.")
            else
                inst.components.talker:Say(
                    "                                              需要san值为250点才可以。")
            end
        end
        return false
    end

    -- 需要消耗材料才行
    if not (reader.components.inventory:Has("greengem", 1) and reader.components.inventory:Has("purplegem", 4)) then
        if reader.components.talker then
            if TUNING.LANGUAGE == "English" then
                reader.components.talker:Say("Requires 1 emerald and 4 purple gems.")
            else
                reader.components.talker:Say("需要用到1颗绿宝石和4颗紫宝石。")
            end
        end
        return true
    end
    reader.components.inventory:ConsumeByName("greengem", 1)
    reader.components.inventory:ConsumeByName("purplegem", 4)

    -- 定义反馈语句
    local feedback_cn =
        {"感觉头好痛...", "我到底干了什么！", "我快成笨蛋了！", "可以反悔吗？"}
    local feedback_en = {"My head hurts...", "What have I done!", "I'm getting dumber!", "Can I take it back?"}
    local feedback = TUNING.LANGUAGE == "English" and feedback_en or feedback_cn

    -- 消耗大量理智值
    local function DecreaseSanityOverTime()
        if reader.components.sanity.current > 1 then
            reader.components.sanity:DoDelta(-50)
            local random_feedback = feedback[math.random(#feedback)]
            reader.components.talker:Say(random_feedback)
            reader:DoTaskInTime(2, DecreaseSanityOverTime)
        end
    end
    DecreaseSanityOverTime()

    local season_manager = GetSeasonManager()
    if season_manager then
        local current_season = season_manager:GetSeasonString()
        if SaveGameIndex:IsModePorkland() then
            if current_season == "lush" then
                season_manager:StartTemperate()
                reader.components.talker:Say(TUNING.LANGUAGE == "English" and "Temperate season has arrived!" or
                                                 "平和季来了！")
            elseif current_season == "aporkalypse" then
                reader.components.talker:Say(TUNING.LANGUAGE == "English" and "I can't escape the Aporkalypse!" or
                                                 "我没有办法逃离毁灭季！")
            elseif current_season == "temperate" then
                season_manager:StartHumid()
                reader.components.talker:Say(TUNING.LANGUAGE == "English" and "Humid season has arrived!" or
                                                 "潮湿季到了")
            elseif current_season == "humid" then
                season_manager:StartLush()
                reader.components.talker:Say(TUNING.LANGUAGE == "English" and "Lush season has arrived!" or
                                                 "繁茂季到了")
            end
        elseif SaveGameIndex:IsModeShipwrecked() then
            if current_season == "green" then
                season_manager:StartDry()
                reader.components.talker:Say(TUNING.LANGUAGE == "English" and "Dry season has arrived!" or
                                                 "旱季来了！")
            elseif current_season == "dry" then
                season_manager:StartMild()
                reader.components.talker:Say(TUNING.LANGUAGE == "English" and "Mild season has arrived!" or
                                                 "温和季来了！")
            elseif current_season == "mild" then
                season_manager:StartWet()
                reader.components.talker:Say(TUNING.LANGUAGE == "English" and "Hurricane season has arrived!" or
                                                 "飓风季到了")
            elseif current_season == "wet" then
                season_manager:StartGreen()
                reader.components.talker:Say(TUNING.LANGUAGE == "English" and "Monsoon season has arrived!" or
                                                 "雨季到了")
            end
        else
            if current_season == "autumn" then
                season_manager:StartWinter()
                reader.components.talker:Say(TUNING.LANGUAGE == "English" and "Winter has arrived!" or "冬天来了！")
            elseif current_season == "winter" then
                season_manager:StartSpring()
                reader.components.talker:Say(TUNING.LANGUAGE == "English" and "Spring has arrived!" or "春天来了！")
            elseif current_season == "spring" then
                season_manager:StartSummer()
                reader.components.talker:Say(TUNING.LANGUAGE == "English" and "Summer has arrived!" or "夏天到了")
            elseif current_season == "summer" then
                season_manager:StartAutumn()
                reader.components.talker:Say(TUNING.LANGUAGE == "English" and "Autumn has arrived!" or "秋天到了")
            end
        end
    end

    return true
end

function onfinished(inst)
    inst:Remove()
end

function MakeBook(name, usefn, bookuses, testfn)
    local function fn(Sim)
        local inst = CreateEntity()
        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddSoundEmitter()

        inst.AnimState:SetBank("story_book")
        inst.AnimState:SetBuild("story_book")
        inst.AnimState:PlayAnimation("idle")

        MakeInventoryPhysics(inst)
        MakeSmallBurnable(inst)
        MakeSmallPropagator(inst)

        if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
            MakeInventoryFloatable(inst, "idle_water", "idle")
        end

        inst:AddComponent("inspectable")
        inst:AddComponent("book")
        inst.components.book.onread = usefn
        inst.components.book.onreadtest = testfn

        inst:AddComponent("inventoryitem")
        inst.components.inventoryitem.imagename = "story_book"
        inst.components.inventoryitem.atlasname = "images/inventoryimages/story_book.xml"

        if TUNING.STORY_BOOK ~= "story" then
            inst:AddComponent("finiteuses")
            inst.components.finiteuses:SetMaxUses(5)
            inst.components.finiteuses:SetUses(5)
            inst.components.finiteuses:SetOnFinished(onfinished)
        end

        return inst
    end

    return Prefab("common/inventory/story_book", fn, assets, prefabs)
end

if TUNING.STORY_BOOK == "season" then
    return MakeBook("season", season, 5)
end
if TUNING.STORY_BOOK == "weather" then
    return MakeBook("weather", weather, 5)
end
if TUNING.STORY_BOOK == "recover" then
    return MakeBook("recover", recover, 5)
end
if TUNING.STORY_BOOK == "story" then
    return MakeBook("story", story, 5)
end

