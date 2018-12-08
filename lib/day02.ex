defmodule Advent2018.Day02 do
  @input ~w(
    bazvmqthjtrnlosiecxyghkwud
    pazvmqbijirzlosiecxyghkwud
    pazvtqbmjtrnlosiecxyghkwzd
    pazvmqbfjtrjlosnlcxyghkwud
    pazvkqbfjtrtlosiecjyghkwud
    paztmqbfjtrnbosiecxyglkwud
    pazvmqbfjtunlosievxmghkwud
    pazvmqbfjtmngosiecyyghkwud
    jazvmqbfjtrnlosiecxygikpud
    pazvqqbfctrnlosimcxyghkwud
    pazvmqbfjtrnwogiecxyihkwud
    pazvmqbfjtrqlojiecxeghkwud
    payvmqbfjtrzlosiecxyghkwuk
    pkzvmqnfjtrnlosieciyghkwud
    pazvmqqfjtrnldsiecxyghkwui
    pazvmqbfttrqlosiecxywhkwud
    gazvmybfjthnlosiecxyghkwud
    pazvmqbfjtrnlasiecxygptwud
    pktvmqbfjtrnwosiecxyghkwud
    pazvmqwfjtrnlosiecxgghkkud
    pazvmzkbjtrnlosiecxyghkwud
    pazvmqbfjtrnloslecxyghuwui
    pezvmqbfjtrnlesieyxyghkwud
    cazvmqbfjrrnlosiecxyghkmud
    pazvmqrfjjrnlosiecxyghkwnd
    pazvmqbgjtrnlosiecxyphtwud
    pazvmqbvmtrnlosiecxyghkpud
    pazdmqbfjtrnlosiecxyuhkpud
    pazvmqbflnrnloshecxyghkwud
    pazvvqbfjprilosiecxyghkwud
    pazvwqbfjtrllosiecxyghknud
    pazvmqbfjtrnloniecxdghkaud
    pazvmqbfjtrnlvsuecxynhkwud
    ptzvmqwfjtrnlosieccyghkwud
    pkzvmqbjjtrnlosiecryghkwud
    pazvmqqfjtrexosiecxyghkwud
    pazgmqbfjtrneoyiecxyghkwud
    paznmqbfjtrnlosiecxydhkwzd
    pazvmqbfjtrnaosiwcxsghkwud
    pazomqbfjxrnlosiewxyghkwud
    pazsmqbfjprnlosiecxrghkwud
    pazvmqbfqtrnoosiecxygmkwud
    aazvmqbfjtrnlosiacxyghjwud
    pazviqbfjtrnlobiecxygrkwud
    qazwmqbfjhrnlosiecxyghkwud
    pazvmqbfftrnlosiqcxygfkwud
    patvmqbfjtonlosircxyghkwud
    pazvmqbfjtrnlomaecxyghkpud
    paztmqbfjtrulossecxyghkwud
    pazvmqbijtrnlobiecxyghkwkd
    pazvsqbfjtrnlospecxyghkqud
    pbzmmqbfjtrnlosiecxyghkwhd
    pezvkqbfjtenlosiecxyghkwud
    razvmqbfjkrnlosiecxeghkwud
    pazcmqbfjtrnloriecxyghkgud
    pazvmqbfftfnlosiecvyghkwud
    pazvmqpujtrnlosiepxyghkwud
    patvgqbfjtrnloslecxyghkwud
    pazvmqbfltrnlosibcxyghswud
    pazvmebfjtrnlosaecxyehkwud
    pazdmqbejtrnlosiecxyghrwud
    pazvmcbfntrplosiecxyghkwud
    pszvmqbfjtrnlosivcfyghkwud
    puzvmqbfjtrnloeiecxyxhkwud
    pazvmqbfjtrivooiecxyghkwud
    pazvyqbfjtrngosiwcxyghkwud
    pauvmqbfjtrnlosimexyghkwud
    pazvmqbfjtrnwoshecxeghkwud
    dazvmqbfjtrnloshecxygxkwud
    pazvmqbfjtrtdosiecxyghvwud
    pazxmqbfjtrnlosieceyghjwud
    pazvmqbfjtrnlosihexjghkwud
    pazvmqbfjsrnlosiecxughiwud
    phzvcqbfjtrqlosiecxyghkwud
    pazvmibfjtrnlosjecxxghkwud
    pazvmqbfjtrbeosiecxlghkwud
    pazvmqyfjttolosiecxyghkwud
    fawvmqbfjtrnlosiecxyghkwhd
    pazvmqbfjprnxosiecxyghkbud
    macvmqbfjtrnlosiesxyghkwud
    pazsmqbfjtrflouiecxyghkwud
    pacvmqbfjtrnltsiecxyghcwud
    pazvmqbfjtymlosiecxygykwud
    pazvmqbfjtrclosiecxygukwmd
    pazvmqbfjtrnlobiecxphhkwud
    mazvmqbhitrnlosiecxyghkwud
    pazvmqdtjtrnlrsiecxyghkwud
    pazvmqbfjgrnllsieczyghkwud
    pazvmqbfjtrilosiecxxgikwud
    pazvmqbjjtrnlosreceyghkwud
    paxvmmbfjtrilosiecxyghkwud
    pazqmwbfjtrnlowiecxyghkwud
    pazvmqbfjfrnqosiecxyghkwui
    pazvmqbfjtrrgosiecxyghswud
    pazvmqnfjtrnlosiecsyghkwmd
    paiemqbmjtrnlosiecxyghkwud
    pazvmqbfdtqnlosiecxyjhkwud
    pazvmxbfjthndosiecxyghkwud
    pqzvmqbfjtrnlosiecxbghkzud
    pagrmqbfjtrnlosiecxygskwud
    pazamqtfjtrnsosiecxyghkwud
    pazvmqbfjtrnldshecxyzhkwud
    pazvmnbfjtrllosieclyghkwud
    snzvmqbfjnrnlosiecxyghkwud
    pazvsqbfjdrnlosiecxyghswud
    pazvmqnfjfrnlosiecsyghkwud
    pazvmqbfjtrnlosiecxjghowum
    pazvmqbfjtjnlosieczygfkwud
    pazvmqbsjtrnloziecxyghkeud
    pazvxqbgjtrnlooiecxyghkwud
    pazvmqbfjtrnlooiecxmyhkwud
    pazvmqbyftrnlosgecxyghkwud
    pazvmqbfjtrnlosiwcxyqhksud
    pazvmqkyjtrnlokiecxyghkwud
    pazfmqbfjtrnlosijcxyohkwud
    pazvmqbfjtrnlociecxygikcud
    fazvmqbfjtrnlosiecxyjhkuud
    pazvmqbojtknlohiecxyghkwud
    pazvmqbfjtgnlosbecxyghkwux
    pazvmqbfjtrnlocieckoghkwud
    pazvdqbfjtrlltsiecxyghkwud
    pazvmqbfjtsnlfsiecxyglkwud
    przvpqbfjtrnyosiecxyghkwud
    pazvmbrfjtrnlosiecxmghkwud
    dazvmqbfttrnlostecxyghkwud
    pazvmqbfttdnlosiecxygwkwud
    pazvmqbvitrnlosieexyghkwud
    pazvmqbfjhrnlosjecxyvhkwud
    pazvmqbfstrnlosiecxyggkwpd
    bazvmqbfjtrnlmsiecxyohkwud
    patmmqbfjtrnlosizcxyghkwud
    pazvmqbfwtrglosieqxyghkwud
    pazvmqbfjtrnlosiecxdhhkwmd
    pazvmqbfjdrnlosnexxyghkwud
    oazrrqbfjtrnlosiecxyghkwud
    pazvmqbfjcrnlosiecxygakwjd
    pazvmqbfjtrnlosifcxfghkwyd
    pazvmnbfjtrnlosiecxyahzwud
    pazvmqbfgtrnlojiecxyghkgud
    pazvmqbfjtrnlaliecxyghkwuy
    pazvmqbfjtrnlfsiecrtghkwud
    pazvmqbkjtrnloswecxdghkwud
    pazvtqbfjtdnlosiecxyghkwuu
    pozvmqbfrtrnlosiesxyghkwud
    payvmqbfjornlossecxyghkwud
    pazvuqbfjtrnlosiscxyghkpud
    pgzcmqbfjtrnlotiecxyghkwud
    pazvvqbfjtrnlobieyxyghkwud
    pazycqbfjtrnlosiecxyzhkwud
    pizvdqbfjtrnlosiecxbghkwud
    pazvmqbfjtrnloqiecxmgtkwud
    gazvmqbfjtrnlusiecxpghkwud
    pazvmqdfjtralosiecxyghkwmd
    pazvmqbfjtmnlosiecxywhawud
    pazvlqbfjtrnlosqecxyghqwud
    pazvmqbfjtrnlhsneixyghkwud
    kazvmqbfjtrqlosimcxyghkwud
    pazvmwbfjtrclosiecxyghkuud
    pazvmqjfjtrnlosieckyghpwud
    pezvmqbgjtrnloseecxyghkwud
    pazvqqbfjtfnlosvecxyghkwud
    oazvmqbfjtunlosiecxyghkwad
    pazvmqbfjtrncoswecxyghfwud
    pazvyqbfjtrnlosqecxygtkwud
    pazvmqbfjtrvlzsiecxygwkwud
    pazvmqbfjjrnlosiekxylhkwud
    madvmqbfjtrnlosircxyghkwud
    pazvmybfjtrnlisiecxyghkwbd
    pazvmqbjjixnlosiecxyghkwud
    pazvmqefjtrnloqiecxyghhwud
    pazveqbfjtrnlosiecgygzkwud
    pazvmqbfjtrxlosiecxmgwkwud
    uazvmqufjtrnlosiecxyghkwuo
    pasymqbfjtrnlosiecxyghowud
    pazvmqbfjtlnlpsiecxyghswud
    pnzvmqbfjprnloszecxyghkwud
    pafjmqcfjtrnlosiecxyghkwud
    pazvmqxfbtrnloqiecxyghkwud
    pazvmzbfjtrnposiccxyghkwud
    pazvmqbfjotulosiecxyghkwud
    pazvmqbfotrnlosgecxykhkwud
    przvmqbfjtrnlosiecxyqhkwcd
    pazvmqbfjtsnlogiecxyyhkwud
    pazvmqbfrtrnlzsiecxyghkwug
    pazvmqbfjtrnlosiecxzgukwuo
    pqzvmqbqjtrnlosdecxyghkwud
    pazvmqbfjtqqlosiecxughkwud
    pazvmqbfjtrnlosiedhyphkwud
    pazsmqbcutrnlosiecxyghkwud
    pazvmqbgrtrnlosiecxyghpwud
    pazemqbfjtznlosiecxyghkvud
    pazvkqbfjtrilosiecxyghkwod
    pfzvmqbfjtrnlopiecxygjkwud
    pazvmqvfjtreloniecxyghkwud
    pazvmqbfjernljsiecxgghkwud
    pazvmqikjtrnlosiecxyghqwud
    pazvmqbfjtrnpesoecxyghkwud
    fazvmqbfjtrnlosihchyghkwud
    pazvmqbfjtgnloanecxyghkwud
    pazvmqsfjqrnlosiecxychkwud
    parvmqbfjtrnlosiecxygfuwud
    przvmqbfjtrhlosihcxyghkwud
    pazvmqbcjtrnlosimcxgghkwud
    pazvmqbfjtrnlosceciyjhkwud
    pazvkqbfjtrylosivcxyghkwud
    pazvmqbfjtrnlgsieoxyghdwud
    pazvmqnfstrnlowiecxyghkwud
    pazvmqbfdtrnlosieumyghkwud
    pazvmqbfjtrnlosyecxfghkwul
    pazvmqbfjtrclosivcxyghkcud
    pazjmqbfjtrnlosiecxygokwkd
    hazvmqbfjtrflosiecxzghkwud
    wazvmqbfjtrnlomiecxyphkwud
    yazvmqbfjirnkosiecxyghkwud
    pczvmqbfjtrnlohiecxyghkwpd
    pazvmqbfotrbeosiecxlghkwud
    pazvmqbfjtrplosiecxynhzwud
    paxvbqbwjtrnlosiecxyghkwud
    pazvmqvfjtrnlosiecbyghqwud
    pazjmqbfjtrnlosiecxoghkwed
    pazvmqbfjtreljsitcxyghkwud
    mazamqbfjtrnlosiecxoghkwud
    pazvmqbfjjrnposiscxyghkwud
    pbrvmqbfjtrnloliecxyghkwud
    pazvmqbfjtrnlosiecxgghkyyd
    pmzvmqbfntrnlosiecxyghkwuw
    pazvzqbfjtrnlosienxyghzwud
    pazvmqifjtvnlosrecxyghkwud
    tazvmqbhjtjnlosiecxyghkwud
    pazvmqbfjtlnxosiecxyghkwuo
    pazvmqbfjennlosiecxyghkwxd
    pahvmqbfjhrnlosiecxythkwud
    pazvmlkfjtrnlxsiecxyghkwud
    pfzvmqbojtrnlosieciyghkwud
    pazvbqbfjtrollsiecxyghkwud
    eazvmqbfjtrnlosiecayghkoud
    pazvmqbfjtjnlvsiecxyghkwsd
    pazvoqbojtrnlosiecfyghkwud
    pazvmqbfjtuslosiecxyghksud
    pazvmqbfjnrnlosiedxyghkwup
    pazvmqbjjtrnlosieaxyghdwud
    pazccqbfjtrhlosiecxyghkwud
    pbzvmqkfjtrnlosievxyghkwud
    pazvmqrljtrnlosiscxyghkwud
    pazvmqbfjfoqlosiecxyghkwud
    pazcmqbfjtrnlosiecxyihkwuf
    pszvmqbfjtrnnosiacxyghkwud
    aazvmqbfjtrnlosieyxyghkwld
    pazvrqbfntrnlosiycxyghkwud
    pkzvoqbfjtrnlosiecxyghxwud
  )

  def one do
    {result_two, result_three} =
      Enum.reduce @input, {0, 0}, fn id, {two, three} ->
        {result_two, result_three} = find_dup_tokens(id)
        {result_two + two, result_three + three}
      end
    result_two * result_three
  end

  def two do
    two(@input)
  end

  # entry
  def two([id | rest]),
    do: two(id, rest)

  # end no match
  def two(_, []),
    do: {:error, :no_match}

  def two(id1, [id2 | rest] = targets) do
    case find_matching_box(id1, targets) do
      nil -> two(id2, rest)
      box_id -> box_id
    end
  end

  defp find_dup_tokens(id) do
    map = map_token_counts(id)
    vals = Map.values(map)
    twos = if 2 in vals, do: 1
    threes = if 3 in vals, do: 1
    {twos || 0, threes || 0}
  end

  defp map_token_counts(id) do
    id
    |> String.to_charlist()
    |> Enum.reduce(%{}, fn c, acc ->
      Map.update(acc, c, 1, fn n -> n + 1 end)
    end)
  end

  defp find_matching_box(_, []),
   do: nil

  defp find_matching_box(id1, [id2 | rest]) do
    letters1 = String.graphemes(id1)
    letters2 = String.graphemes(id2)
    case compare_boxes(letters1, letters2, 0, []) do
      nil -> find_matching_box(id1, rest)
      box_id -> box_id
    end
  end

  defp compare_boxes(_, _, diffs_so_far, _) when diffs_so_far > 1, do: nil

  # letters are the same
  defp compare_boxes([a | rest1], [a | rest2], diffs_so_far, letters_so_far),
    do: compare_boxes(rest1, rest2, diffs_so_far, [a | letters_so_far])


  # letters are different
  defp compare_boxes([_ | rest1], [_ | rest2], diffs_so_far, letters_so_far),
    do: compare_boxes(rest1, rest2, diffs_so_far + 1, letters_so_far)

  # we've got to the end and we're good... found a match!
  defp compare_boxes([], [], _, letters),
    do: letters |> Enum.reverse() |> Enum.join("")
end
